## 前置条件

本项目基于 [Nvchad](https://github.com/NvChad/NvChad) ，使用前需要满足以下条件

1. [Neovim 0.9.4+](https://github.com/neovim/neovim/releases/tag/v0.9.4)
2. 终端字体使用 [Nerd Font](https://www.nerdfonts.com/)
3. gcc
4. make
5. [Ripgrep](https://github.com/BurntSushi/ripgrep) (可选)

## 使用方式

### Windows 平台

- 安装 `Neovim`、`gcc`、`make`、`ripgrep`

```shell
scoop install neovim gcc make ripgrep
```

- 配置终端字体为 `Nerd Font`
- 备份原有配置

```powershell
Test-Path $ENV:USERPROFILE\AppData\Local\nvim && Copy-Item -Recurse -Path $ENV:USERPROFILE\AppData\Local\nvim -Destination $ENV:USERPROFILE\AppData\Local\nvim-back
```

- 克隆仓库

```shell
git clone --recurse-submodules https://github.com/resticDOG/nvim-nvchad-config.git
```

- 建立软连接 使用管理员权限打开 `powershell`(或者 `pwsh`)

```powershell
cd nvim-nvchad-config
./setup.ps1
```

- 初始化

```shell
nvim
```

### Linux 平台 （TODO）
