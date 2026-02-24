# ---------- PATH ----------
typeset -U path PATH
path=(
  "$HOME/.local/bin"
  "$HOME/.cargo/bin"
  /usr/local/bin
  /usr/bin
  $path
)
export PATH
