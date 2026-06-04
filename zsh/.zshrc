# ~/.zshrc — macOS
[[ -o interactive ]] || return

# ---------- Homebrew ----------
if command -v brew >/dev/null 2>&1; then
  eval "$(brew shellenv)"
fi

# ---------- PATH ----------
typeset -U path PATH
path=(
  "$HOME/.local/bin"
  "$HOME/.cargo/bin"
  /usr/local/bin
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
alias rlz='source ~/.zshrc'


# ---------- Plugins ----------
source "$(brew --prefix zsh-autosuggestions)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# zsh-syntax-highlighting (MUST be last among plugins)
source "$(brew --prefix zsh-syntax-highlighting)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# ---------- Prompt ----------
eval "$(starship init zsh)"
