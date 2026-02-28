[[ "$(uname -s)" == "Darwin" ]] || return

# Convenience: consistent "open" name across platforms
alias o='open'

# Clipboard helpers
alias clipcopy='pbcopy'
alias clippaste='pbpaste'

# Homebrew LLVM toolchain
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export CC="/opt/homebrew/opt/llvm/bin/clang"
export CXX="/opt/homebrew/opt/llvm/bin/clang++"
export AR="/opt/homebrew/opt/llvm/bin/llvm-ar"
export NM="/opt/homebrew/opt/llvm/bin/llvm-nm"
export RANLIB="/opt/homebrew/opt/llvm/bin/llvm-ranlib"
