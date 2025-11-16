#!/usr/bin/env bash
set -e
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
backup_file() { [ -e "$1" ] && [ ! -L "$1" ] && mv "$1" "$1.bak"; }
link_file() { backup_file "$2"; ln -sf "$1" "$2"; }
link_file "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
link_file "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
link_file "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
link_file "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
echo "Done. Run: source ~/.bashrc"
