[[ "$(uname -s)" == "Linux" ]] || return

# Convenience: consistent "open" name across platforms
if command -v xdg-open >/dev/null 2>&1; then
  alias o='xdg-open'
fi

# Clipboard helpers (Wayland first, then X11)
if command -v wl-copy >/dev/null 2>&1; then
  alias clipcopy='wl-copy'
  alias clippaste='wl-paste'
elif command -v xclip >/dev/null 2>&1; then
  alias clipcopy='xclip -selection clipboard'
  alias clippaste='xclip -selection clipboard -o'
fi
