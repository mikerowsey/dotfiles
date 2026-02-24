# ---------- Plugins ----------
# Helper: source first existing file from a list
_source_first() {
  local f
  for f in "$@"; do
    [[ -r "$f" ]] && source "$f" && return 0
  done
  return 1
}

ZAS_PREFIX=""
ZSHL_PREFIX=""
if command -v brew >/dev/null 2>&1; then
  ZAS_PREFIX="$(brew --prefix zsh-autosuggestions 2>/dev/null)"
  ZSHL_PREFIX="$(brew --prefix zsh-syntax-highlighting 2>/dev/null)"
fi

# zsh-autosuggestions
_source_first   "${ZAS_PREFIX:+$ZAS_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh}"   "${ZAS_PREFIX:+$ZAS_PREFIX/zsh-autosuggestions.zsh}"   /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh   /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting (MUST be last among plugins)
_source_first   "${ZSHL_PREFIX:+$ZSHL_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh}"   "${ZSHL_PREFIX:+$ZSHL_PREFIX/zsh-syntax-highlighting.zsh}"   /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh   /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
