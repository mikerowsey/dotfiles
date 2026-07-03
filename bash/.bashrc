HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoredups
shopt -s histappend
shopt -s checkwinsize

export EDITOR=vim
export VISUAL=vim
export PATH="$HOME/.local/bin:$PATH"

if command -v eza &> /dev/null; then
    alias l="eza -F"
    alias ll="eza -lh --git --icons"
    alias la="eza -lah --git --icons"

    if command -v fd &> /dev/null; then
        export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
        export FZF_ALT_C_COMMAND='fd --type d --strip-cwd-prefix --hidden --follow --exclude .git'
    fi
    export FZF_CTRL_T_OPTS="--preview 'if [ -d {} ]; then eza -B --icons --color=always {}; else cat {}; fi'"
else
    alias l='ls -CF'
    alias ll="ls -lh --color=auto"
    alias la="ls -lah --color=auto"
    export FZF_CTRL_T_OPTS="--preview 'if [ -d {} ]; then ls -F {}; else cat {}; fi'"
fi

RED='\[\e[1;31m\]'
GREEN='\[\e[1;32m\]'
YELLOW='\[\e[1;33m\]'
RESET='\[\e[0m\]'

parse_git_branch() {
    git branch --show-current 2>/dev/null | sed 's/^/ [/;s/$/]/'
}

PS1="\n${RED}\u@\h ${GREEN}\w${YELLOW}\$(parse_git_branch)${RESET}\n\\$ "

if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

bind "set completion-ignore-case on"

if [ -f ~/.fzf.bash ]; then
    . ~/.fzf.bash
elif [ -f /usr/share/doc/fzf/examples/key-bindings.bash ]; then
    . /usr/share/doc/fzf/examples/key-bindings.bash
    . /usr/share/doc/fzf/examples/completion.bash
elif [ -f /usr/share/fzf/key-bindings.bash ]; then
    . /usr/share/fzf/key-bindings.bash
    . /usr/share/fzf/completion.bash
fi

if info_fzf=$(bind -p | grep fzf-cd-widget) 2>/dev/null; then
    bind '"\C-g": fzf-cd-widget'
fi
