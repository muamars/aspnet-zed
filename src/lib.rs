use std::fs;
use zed_extension_api::{self as zed, settings::LspSettings, LanguageServerId, Result};

const OMNISHARP_ID: &str = "omnisharp";

struct AspnetExtension {
    cached_binary_path: Option<String>,
}

impl AspnetExtension {
    fn language_server_binary(
        &mut self,
        language_server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<String> {
        // 1. Check user-configured LSP binary path
        let binary_settings = LspSettings::for_worktree("omnisharp", worktree)
            .ok()
            .and_then(|s| s.binary);

        if let Some(ref binary_settings) = binary_settings {
            if let Some(ref path) = binary_settings.path {
                return Ok(path.clone());
            }
        }

        // 2. Check if OmniSharp is in PATH
        if let Some(path) = worktree.which("OmniSharp") {
            return Ok(path);
        }

        // 3. Use cached binary if still valid
        if let Some(ref path) = self.cached_binary_path {
            if fs::metadata(path).is_ok_and(|stat| stat.is_file()) {
                return Ok(path.clone());
            }
        }

        // 4. Download OmniSharp from GitHub releases
        zed::set_language_server_installation_status(
            language_server_id,
            &zed::LanguageServerInstallationStatus::CheckingForUpdate,
        );

        let release = zed::latest_github_release(
            "OmniSharp/omnisharp-roslyn",
            zed::GithubReleaseOptions {
                require_assets: true,
                pre_release: false,
            },
        )?;

        let (platform, arch) = zed::current_platform();
        let asset_name = format!(
            "omnisharp-{os}-{arch}-net6.0.{ext}",
            os = match platform {
                zed::Os::Mac => "osx",
                zed::Os::Linux => "linux",
                zed::Os::Windows => "win",
            },
            arch = match arch {
                zed::Architecture::Aarch64 => "arm64",
                zed::Architecture::X86 => "x86",
                zed::Architecture::X8664 => "x64",
            },
            ext = match platform {
                zed::Os::Mac | zed::Os::Linux => "tar.gz",
                zed::Os::Windows => "zip",
            }
        );

        let asset = release
            .assets
            .iter()
            .find(|a| a.name == asset_name)
            .ok_or_else(|| format!("no asset found matching {:?}", asset_name))?;

        let version_dir = format!("{OMNISHARP_ID}-{}", release.version);
        let binary_path = match platform {
            zed::Os::Windows => format!("{version_dir}/OmniSharp.exe"),
            _ => format!("{version_dir}/OmniSharp"),
        };

        if !fs::metadata(&binary_path).is_ok_and(|stat| stat.is_file()) {
            zed::set_language_server_installation_status(
                language_server_id,
                &zed::LanguageServerInstallationStatus::Downloading,
            );

            zed::download_file(
                &asset.download_url,
                &version_dir,
                match platform {
                    zed::Os::Mac | zed::Os::Linux => zed::DownloadedFileType::GzipTar,
                    zed::Os::Windows => zed::DownloadedFileType::Zip,
                },
            )
            .map_err(|e| format!("failed to download omnisharp: {e}"))?;

            // Remove outdated versions
            if let Ok(entries) = fs::read_dir(".") {
                for entry in entries.flatten() {
                    let name = entry.file_name().to_string_lossy().into_owned();
                    if name.starts_with(OMNISHARP_ID) && name != version_dir {
                        let _ = fs::remove_dir_all(entry.path());
                    }
                }
            }
        }

        self.cached_binary_path = Some(binary_path.clone());
        Ok(binary_path)
    }
}

impl zed::Extension for AspnetExtension {
    fn new() -> Self {
        Self {
            cached_binary_path: None,
        }
    }

    fn language_server_command(
        &mut self,
        language_server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<zed::Command> {
        match language_server_id.as_ref() {
            OMNISHARP_ID => {
                let path = self.language_server_binary(language_server_id, worktree)?;
                let args = LspSettings::for_worktree("omnisharp", worktree)
                    .ok()
                    .and_then(|s| s.binary)
                    .and_then(|b| b.arguments)
                    .unwrap_or_else(|| vec!["-lsp".into()]);

                Ok(zed::Command {
                    command: path,
                    args,
                    env: Default::default(),
                })
            }
            id => Err(format!("unknown language server: {id}")),
        }
    }
}

zed::register_extension!(AspnetExtension);
