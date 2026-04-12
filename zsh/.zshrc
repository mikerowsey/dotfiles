# ~/.zshrc
[[ -o interactive ]] || return

ZSHRCD="$HOME/.zshrc.d"
if [[ -d "$ZSHRCD" ]]; then
  for f in "$ZSHRCD"/*.zsh; do
    [[ -r "$f" ]] && source "$f"
  done
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
