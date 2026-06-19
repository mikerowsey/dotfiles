# Homebrew environment

if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

# User binaries

export PATH="$HOME/.local/bin:$PATH"

# Load bashrc

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
