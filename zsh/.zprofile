export EDITOR=nvim
export VISUAL=$EDITOR

if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
