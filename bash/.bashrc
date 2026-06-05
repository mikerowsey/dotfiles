# ~/.bashrc

case $- in
    *i*) ;;
      *) return ;;
esac

export EDITOR=nvim
export VISUAL=nvim
export PAGER=less

export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth

shopt -s histappend
shopt -s checkwinsize

# Cargo (safe if missing)
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

PS1='\u@\h:\w\$ '

if command -v eza >/dev/null 2>&1; then
    alias ls='eza --icons'
    alias ll='eza -lh --icons'
    alias la='eza -lha --icons'
else
    alias ll='ls -lah'
    alias la='ls -A'
fi

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias py='python3'
if command -v nvim >/dev/null 2>&1; then
    alias v='nvim'
    alias vim='nvim'
fi

alias rlb='source ~/.bashrc'

[ -f ~/.bashrc.local ] && . ~/.bashrc.local
