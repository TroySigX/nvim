# Neovim config file

<a href="https://dotfyle.com/TroySigX/nvim"><img src="https://dotfyle.com/TroySigX/nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/TroySigX/nvim"><img src="https://dotfyle.com/TroySigX/nvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/TroySigX/nvim"><img src="https://dotfyle.com/TroySigX/nvim/badges/plugin-manager?style=flat" /></a>


## Install Instructions

 > Install requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone git@github.com:TroySigX/nvim ~/.config/TroySigX/nvim
NVIM_APPNAME=TroySigX/nvim/ nvim --headless +"Lazy! sync" +qa
```

Open Neovim with this config:

```sh
NVIM_APPNAME=TroySigX/nvim/ nvim
```

## Get started:
Run `/setup/install.sh` (for Arch-based only)

## Install Mason packages:
* jsonlint
* shellcheck
* stylua
* prettier

## Language-based packages:
* Markdown:
    + Compiler: pandoc
* Latex:
    + Compiler: texlive-most
    + LSP: texlab
* C/C++:
    + Make utility: bear
* Rust:
    + LSP: rust_analyzer
