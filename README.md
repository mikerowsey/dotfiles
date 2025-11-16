# Basic Dotfiles

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
![Linux](https://img.shields.io/badge/OS-Linux-blue)
![Shell: Bash](https://img.shields.io/badge/shell-bash-4EAA25?logo=gnu-bash&logoColor=white)
![Editor: Vim](https://img.shields.io/badge/editor-vim-019733?logo=vim)
![Last Commit](https://img.shields.io/github/last-commit/mikerowsey/dotfiles)
![Repo Size](https://img.shields.io/github/repo-size/mikerowsey/dotfiles)

A minimal, portable set of **dotfiles** designed for clean Linux servers, AWS EC2 instances, WSL, and any environment where you want an immediate quality-of-life upgrade without heavy dependencies.

This setup uses:

- **bash**
- **vim** (no plugins)
- **tmux**
- **simple gitconfig**

A `bootstrap.sh` script safely installs everything by backing up existing dotfiles and symlinking the ones in this repository.

## 📚 Table of Contents
- [Features](#features)
- [Installation](#installation)
- [Included Files](#included-files)
- [Optional Catppuccin Theme](#optional-catppuccin-theme)
- [AWS Usage](#aws-usage)
- [Repository Layout](#repository-layout)
- [Philosophy](#philosophy)
- [Compatibility](#compatibility)
- [License](#license)

## ✨ Features

### Vim
- Relative + absolute line numbers  
- Sensible 4-space indentation  
- `evening` colorscheme by default  
- Optional Catppuccin theme support  
- Cursor line, smart search, clean behavior

### Bash
- Clean prompt (`user@host:cwd$`)  
- Modern shell history settings  
- Helpful aliases (`ll`, `gs`, `gl`, etc.)  
- `EDITOR=vim`

### Tmux
- Status bar at the **top**  
- Windows & panes start at **1**  
- Mouse mode enabled  
- Vim-style pane navigation  
- Clean splits with `|` and `-`  
- Uses **Ctrl-A** as prefix

### Git
- Helpful aliases  
- Modern defaults  
- Simple, readable config

## 🚀 Installation

```bash
git clone https://github.com/mikerowsey/dotfiles.git
cd dotfiles
chmod +x bootstrap.sh
./bootstrap.sh
source ~/.bashrc
```

## 🎨 Optional Catppuccin Theme

```bash
mkdir -p ~/.vim/pack/themes/start
git clone https://github.com/catppuccin/vim.git ~/.vim/pack/themes/start/catppuccin
```

Then uncomment in `.vimrc`:

```vim
set termguicolors
packadd! catppuccin
colorscheme catppuccin_mocha
```

## ☁️ AWS Usage

Perfect for fresh EC2 instances.

```bash
sudo yum install git -y    # Amazon Linux
sudo apt install git -y    # Ubuntu
```

## 📁 Repository Layout

```
dotfiles/
 ├── .vimrc
 ├── .bashrc
 ├── .gitconfig
 ├── .tmux.conf
 ├── bootstrap.sh
 └── README.md
```

## 🧭 Philosophy

Minimal • Portable • Predictable • Safe • Fast

## 🧩 Compatibility

- Amazon Linux 2023  
- Ubuntu 22.04 / 24.04  
- Debian 12  
- WSL2  
- macOS (works, but tuned for Linux)

## 📜 License

MIT — free to use and modify.
