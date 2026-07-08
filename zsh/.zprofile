export EDITOR=nvim
export VISUAL=$EDITOR

if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
fi

export PATH="$HOME/.local/bin:$PATH"
export SDKROOT="$(xcrun --show-sdk-path)"
export CC="clang"
export CXX="clang++"
