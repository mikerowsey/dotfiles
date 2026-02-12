#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$HOME/dotfiles/nvim"
CONFIG_DIR="$HOME/.config/nvim"

echo "Creating Neovim directory structure in $DOTFILES_DIR..."

# Create directories
mkdir -p "$DOTFILES_DIR/lua/core"
mkdir -p "$DOTFILES_DIR/lua/plugins"
mkdir -p "$DOTFILES_DIR/after/ftplugin"
mkdir -p "$DOTFILES_DIR/after/plugin"
mkdir -p "$DOTFILES_DIR/snippets"

# Create empty config files (only if missing)
touch "$DOTFILES_DIR/init.lua"
touch "$DOTFILES_DIR/lua/core/options.lua"
touch "$DOTFILES_DIR/lua/core/keymaps.lua"
touch "$DOTFILES_DIR/lua/core/lazy.lua"
touch "$DOTFILES_DIR/lua/plugins/ui.lua"
touch "$DOTFILES_DIR/lua/plugins/telescope.lua"
touch "$DOTFILES_DIR/lua/plugins/treesitter.lua"
touch "$DOTFILES_DIR/lua/plugins/lsp.lua"
touch "$DOTFILES_DIR/lua/plugins/cmp.lua"
touch "$DOTFILES_DIR/.gitignore"

echo "Ensuring ~/.config exists..."
mkdir -p "$HOME/.config"

# Remove existing config if it's a directory and not a symlink
if [ -d "$CONFIG_DIR" ] && [ ! -L "$CONFIG_DIR" ]; then
    echo "Removing existing ~/.config/nvim directory..."
    rm -rf "$CONFIG_DIR"
fi

# Create symlink if it doesn't exist
if [ ! -e "$CONFIG_DIR" ]; then
    ln -s "$DOTFILES_DIR" "$CONFIG_DIR"
    echo "Symlink created: ~/.config/nvim -> ~/dotfiles/nvim"
else
    echo "~/.config/nvim already exists (likely already linked)."
fi

echo "Done."

