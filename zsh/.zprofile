export EDITOR=nvim
export VISUAL=$EDITOR

if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export CMAKE_PREFIX_PATH="/opt/homebrew/opt/llvm"
    export SDKROOT=$(xcrun --show-sdk-path)
fi

export PATH="$HOME/.local/bin:/opt/homebrew/opt/llvm/bin:$PATH"
