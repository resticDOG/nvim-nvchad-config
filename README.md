> English | [简体中文](./README_zh_CN.md)

## Prerequisites

This project is based on [Nvchad](https://github.com/NvChad/NvChad), and the
following conditions need to be met before usage:

1. [Neovim 0.9.4+](https://github.com/neovim/neovim/releases/tag/v0.9.4)
2. Terminal font should be [Nerd Font](https://www.nerdfonts.com/)
3. gcc
4. make
5. [Ripgrep](https://github.com/BurntSushi/ripgrep) (optional)

## Usage

### Windows

- Install `Neovim`, `gcc`, `make`, `ripgrep`

```shell
scoop install neovim gcc make ripgrep
```

- Configure terminal font to be `Nerd Font`
- Backup the original configuration

```powersehll
git clone --recurse-submodules https://github.com/resticDOG/nvim-nvchad-config.git
```

- Create a symbolic link Run `powershell` (or `pwsh`) with administrator
  privileges:

```powershell
cd nvim-nvchad-config
./setup.ps1
```

- Initialize

```shell
nvim
```

### Linux
