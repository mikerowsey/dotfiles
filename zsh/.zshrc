typeset -U path PATH
path=(
  "$HOME/.local/bin"
  "$HOME/.cargo/bin"
  /usr/local/bin
  /usr/bin
  $path
)
export PATH

export EDITOR=nvim
export VISUAL=nvim

HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt EXTENDED_GLOB

autoload -Uz compinit
compinit

alias ls='eza --icons'
alias ll='eza -lh --icons'
alias la='eza -lha --icons'
alias vim='nvim'
alias gs='git status'
alias v='nvim'
alias vim='nvim'
alias edz='nvim ~/.zshrc'
alias rlz='source ~/.zshrc'
alias edwm='nvim ~/.config/i3/config'

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

[[ -r /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

[[ -r /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"

