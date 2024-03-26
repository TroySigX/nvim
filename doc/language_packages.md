# Language-based packages

## Note
The following package types should be installed via `Mason`:
- LSP
- Linter
- Formatter
- Debugger

## Available languages
- [C/C++](#cc)
- [Python](#python)
- [JavaScript/TypeScript](#javascripttypescript)
- [Rust](#rust)
- [Lua](#lua)
- [Latex](#latex)
- [Bash](#bash)
- [Markdown](#markdown)
- [Json](#json)

## C/C++
- LSP: `clangd`
- Formatter: `clang-format`
- Debugger: `codelldb`
- Make utitiliy: [bear](https://github.com/rizsotto/Bear)

## Python
- LSP: `basedpyright`
- Formatter: `ruff`
- Debugger: `debugpy`
- Venv management:
  - [poetry](https://archlinux.org/packages/extra/any/python-poetry/)
  - [pyenv](https://archlinux.org/packages/extra/any/pyenv/)

## JavaScript/TypeScript
- LSP: `tsserver`
- Formatter: `eslint_d`
- Linter: `prettierd`
- Debugger: `js-debug-adapter`
- Compiler: [Node.JS](https://nodejs.org/)

## Rust
- LSP: `rust_analyzer`
- debugger: `codelldb`
- Compiler: [Cargo](https://doc.rust-lang.org/cargo/getting-started/installation.html)

## Lua
- LSP: `lua_ls`
- Formatter: `stylua`

## Latex
- LSP: `texlab`
- Compiler: `texlive-most`
- PDF converter: `pdflatex`
- Formatter: `latexindent`
  + Dependency (system package): [libxcrypt-compat](https://archlinux.org/packages/core/x86_64/libxcrypt-compat/)

## Typst
- LSP: `typst_lsp`
- Compiler: [typst](https://archlinux.org/packages/extra/x86_64/typst/)
 
## Bash
- Linter: `shellcheck`

## Markdown
- PDF converter: [pandoc](https://archlinux.org/packages/extra/x86_64/pandoc-cli/)

## Json
- Linter: `jsonlint`
