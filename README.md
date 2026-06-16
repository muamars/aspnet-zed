# ASP.NET — Zed Extension

Syntax highlighting for **ASP.NET Razor Pages** and **Blazor** files in [Zed Editor](https://zed.dev).

Supports `.cshtml` and `.razor` files with `@* *@` block comments and VS Code–style highlighting powered by [tree-sitter-razor](https://github.com/tris203/tree-sitter-razor).

## Features

- **Syntax Highlighting** — Inherits C# highlighting via `;inherits:c_sharp` with additional rules for Razor directives, control flow, and HTML
- **Block Comments** — `@* ... *@` toggle with `Ctrl+/`
- **C# Injection** — Full C# highlighting inside `@code {}`, `@functions {}`, `@if`, `@foreach`, and other embedded blocks
- **CSS & JS Injection** — Highlighting inside `<style>` and `<script>` tags
- **Bracket Matching** — `{}` `[]` `()` `<>` `@* *@` `<!-- -->`
- **Auto-Indentation** — Proper indentation for HTML elements, C# code blocks, and Razor control structures
- **Smart Auto-Close** — `@{ }`, `@( )`, `@* *@`, `<!-- -->`

## Supported File Types

| Extension | Description                     |
| --------- | ------------------------------- |
| `.cshtml` | ASP.NET Razor Pages / MVC Views |
| `.razor`  | Blazor Components               |

## Installation

### From Zed Extensions Gallery

Search for **ASP.NET** in the Zed extensions panel (`Ctrl+Shift+X`) and click **Install**.

### Local Development

1. Clone this repository:

   ```bash
   git clone https://github.com/muamars/aspnet-zed.git
   ```

2. Make sure [Rust](https://rustup.rs/) is installed via `rustup`.

3. In Zed, open the Extensions page (`Ctrl+Shift+X`).

4. Click **Install Dev Extension** and select the cloned directory.

## Highlighting Reference

| Element                                | Highlight Scope        |
| -------------------------------------- | ---------------------- |
| `@page`, `@model`, `@inject`, `@using` | `@keyword.directive`   |
| `@if`, `@switch`                       | `@keyword.conditional` |
| `@for`, `@foreach`, `@while`           | `@keyword.repeat`      |
| `@try`, `catch`, `finally`             | `@keyword.exception`   |
| `@* comment *@`                        | `@comment`             |
| `<tag>`                                | `@tag`                 |
| `@variable`, `@Model.Name`             | `@keyword.coroutine`   |
| C# code blocks                         | `@embedded`            |

## Project Structure

```
aspnet-zed/
├── extension.toml              # Extension manifest
├── LICENSE                     # MIT License
└── languages/
    └── aspnet/
        ├── config.toml         # Language configuration
        ├── highlights.scm      # Syntax highlighting queries
        ├── injections.scm      # C#/CSS/JS injection queries
        ├── brackets.scm        # Bracket matching queries
        └── indents.scm         # Auto-indentation queries
```

## Acknowledgments

- [tree-sitter-razor](https://github.com/tris203/tree-sitter-razor) — Tree-sitter grammar for Razor files
- [Zed Editor](https://zed.dev) — The code editor this extension is built for

## License

[MIT](LICENSE)
