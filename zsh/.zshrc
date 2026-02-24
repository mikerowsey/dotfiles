# Homebrew first (so brew-installed tools resolve predictably)
if command -v brew >/dev/null 2>&1; then
  eval "$(brew shellenv)"
fi

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

# ---------- Editors ----------
export EDITOR=nvim
export VISUAL=nvim

# ---------- History / options ----------
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt EXTENDED_GLOB

# ---------- Completion ----------
autoload -Uz compinit
compinit -C

# ---------- Aliases ----------
alias ls='eza --icons'
alias ll='eza -lh --icons'
alias la='eza -lha --icons'
alias vim='nvim'
alias v='nvim'
alias gs='git status'
alias edz='nvim ~/.zshrc'
alias rlz='source ~/.zshrc'
alias edwm='nvim ~/.config/i3/config'

# ---------- SSH agent socket ----------
# Linux systemd user session typically provides XDG_RUNTIME_DIR.
# Only set if the socket exists and nothing else has already set SSH_AUTH_SOCK.
if [[ -n "${XDG_RUNTIME_DIR:-}" ]] && [[ -S "$XDG_RUNTIME_DIR/ssh-agent.socket" ]] && [[ -z "${SSH_AUTH_SOCK:-}" ]]; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi

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
_source_first \
  "${ZAS_PREFIX:+$ZAS_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh}" \
  "${ZAS_PREFIX:+$ZAS_PREFIX/zsh-autosuggestions.zsh}" \
  /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh \
  /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting (MUST be last among plugins)
_source_first \
  "${ZSHL_PREFIX:+$ZSHL_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh}" \
  "${ZSHL_PREFIX:+$ZSHL_PREFIX/zsh-syntax-highlighting.zsh}" \
  /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
  /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---------- Prompt ----------
eval "$(starship init zsh)"
