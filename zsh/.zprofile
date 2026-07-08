export EDITOR=nvim
export VISUAL=$EDITOR

if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    
    # LLVM toolchain (default C/C++ compiler)
    export CC=/opt/homebrew/opt/llvm/bin/clang
    export CXX=/opt/homebrew/opt/llvm/bin/clang++
    export SDKROOT=$(xcrun --show-sdk-path)
fi

export PATH="$HOME/.local/bin:/opt/homebrew/opt/llvm/bin:$PATH"
