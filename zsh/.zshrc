# ~/.zshrc
[[ -o interactive ]] || return

ZSHRCD="$HOME/.zshrc.d"
if [[ -d "$ZSHRCD" ]]; then
  for f in "$ZSHRCD"/*.zsh; do
    [[ -r "$f" ]] && source "$f"
  done
fi
