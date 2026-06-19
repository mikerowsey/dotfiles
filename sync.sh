#!/bin/bash

# Configuration directories
DOTFILES_DIR="$HOME/.dotfiles"
CONFIG_SRC_DIR="$DOTFILES_DIR/config" # Your custom nested dotfiles folder
OS_TYPE=$(uname)

# Define universal files (Note: names match exactly what is in your repo)
UNIVERSAL_FILES=(".vimrc" ".tmux.conf" ".gitconfig" ".gitignore_global")

# Define OS-specific shell configuration files
if [ "$OS_TYPE" = "Darwin" ]; then
    SHELL_FILES=(".zprofile" ".zshrc")
    OS_NAME="macOS (Zsh)"
elif [ "$OS_TYPE" = "Linux" ]; then
    SHELL_FILES=(".bash_profile" ".bashrc")
    OS_NAME="Linux (Bash)"
else
    echo "Unsupported OS: $OS_TYPE"
    exit 1
fi

usage() {
    echo "Usage: $0 [deploy|backup]"
    echo "  deploy : Copy files from repo ($CONFIG_SRC_DIR) to your Home folder (~/)"
    echo "  backup : Copy files from your Home folder (~) back to the repo config folder"
    exit 1
}

# Ensure an argument is passed
if [ -z "$1" ]; then
    usage
fi

case "$1" in
    deploy)
        echo "=== Deploying dotfiles to Home folder ($OS_NAME) ==="
        echo "Source: $CONFIG_SRC_DIR -> Destination: $HOME/"
        read -p "Are you sure you want to overwrite your active home configs? (y/N) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo "Deployment cancelled."
            exit 0
        fi

        # Copy universal configurations
        for file in "${UNIVERSAL_FILES[@]}"; do
            if [ -f "$CONFIG_SRC_DIR/$file" ]; then
                cp "$CONFIG_SRC_DIR/$file" "$HOME/$file"
                echo "✓ Copied $file"
            else
                echo "⚠ Warning: $file not found in $CONFIG_SRC_DIR"
            fi
        done

        # Copy shell-specific configurations
        for file in "${SHELL_FILES[@]}"; do
            if [ -f "$CONFIG_SRC_DIR/$file" ]; then
                cp "$CONFIG_SRC_DIR/$file" "$HOME/$file"
                echo "✓ Copied $file"
            else
                echo "⚠ Warning: $file not found in $CONFIG_SRC_DIR"
            fi
        done
        echo "Deployment complete! Open a new terminal tab to use your configs."
        ;;

    backup)
        echo "=== Backing up live home dotfiles to Repo ($OS_NAME) ==="
        echo "Source: $HOME/ -> Destination: $CONFIG_SRC_DIR"

        # Ensure the config target folder exists in your repo
        mkdir -p "$CONFIG_SRC_DIR"

        # Backup universal configurations
        for file in "${UNIVERSAL_FILES[@]}"; do
            if [ -f "$HOME/$file" ]; then
                cp "$HOME/$file" "$CONFIG_SRC_DIR/$file"
                echo "✓ Updated repo copy of $file"
            fi
        done

        # Backup shell-specific configurations
        for file in "${SHELL_FILES[@]}"; do
            if [ -f "$HOME/$file" ]; then
                cp "$HOME/$file" "$CONFIG_SRC_DIR/$file"
                echo "✓ Updated repo copy of $file"
            fi
        done
        echo "Backup complete! Your files are updated inside the repository."
        ;;

    *)
        usage
        ;;
esac
