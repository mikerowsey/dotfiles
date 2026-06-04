# ~/.zshrc
[[ -o interactive ]] || return

# ============================================================================
# Environment
# ============================================================================

export EDITOR=nvim
export VISUAL=nvim
export PAGER=less

# Silence Apple bash warning if we occasionally invoke bash
export BASH_SILENCE_DEPRECATION_WARNING=1

# ============================================================================
# PATH
# ============================================================================

typeset -U path

path=(
    /opt/homebrew/bin
    /opt/homebrew/sbin
    $HOME/.local/bin
    $HOME/.cargo/bin
    $HOME/bin
    $path
)

export PATH

# ============================================================================
# History
# ============================================================================

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# ============================================================================
# Shell Behavior
# ============================================================================

setopt AUTO_CD
setopt EXTENDED_GLOB
setopt INTERACTIVE_COMMENTS

# ============================================================================
# Completion
# ============================================================================

autoload -Uz compinit
compinit -C

# ============================================================================
# Aliases
# ============================================================================

# eza if installed
if command -v eza >/dev/null 2>&1; then
    alias ls='eza --icons'
    alias ll='eza -lh --icons'
    alias la='eza -lha --icons'
else
    alias ll='ls -lah'
    alias la='ls -A'
fi

alias vim='nvim'
alias v='nvim'

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'

alias py='python3'

alias ..='cd ..'
alias ...='cd ../..'

alias rlz='source ~/.zshrc'

# ============================================================================
# Functions
# ============================================================================

mkcd() {
    mkdir -p "$1" && cd "$1"
}

largest() {
    du -sh ./* 2>/dev/null | sort -hr | head -20
}

pathshow() {
    printf '%s\n' "${path[@]}"
}

# ============================================================================
# Plugins
# ============================================================================

if brew --prefix zsh-autosuggestions >/dev/null 2>&1; then
    source "$(brew --prefix zsh-autosuggestions)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

if brew --prefix zsh-syntax-highlighting >/dev/null 2>&1; then
    source "$(brew --prefix zsh-syntax-highlighting)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# ============================================================================
# Prompt
# ============================================================================

if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi
