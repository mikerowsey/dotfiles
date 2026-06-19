if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_ALT_C_COMMAND='fd --type d --strip-cwd-prefix --hidden --follow --exclude .git'

if [ -d "$(brew --prefix)/opt/fzf" ]; then
    [[ $- == *i* ]] && source "$(brew --prefix)/opt/fzf/shell/completion.zsh" 2> /dev/null
    source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"

    # Custom Mac-friendly shortcut mapping for your directory jumper
    bindkey '^G' fzf-cd-widget
fi

if command -v eza &> /dev/null; then
    alias ll="eza -lh --git --icons"
    alias la="eza -lah --git --icons"

    export FZF_CTRL_T_OPTS="
      --walker-skip .git,node_modules,target
      --preview 'if [ -d {} ]; then eza -B --icons --color=always {}; else bat --color=always --line-range :500 {} 2>/dev/null || cat {}; fi'
      --bind 'ctrl-/:toggle-preview'"
else
    alias ll="ls -lhG"
    alias la="ls -lahG"

    export FZF_CTRL_T_OPTS="--preview 'if [ -d {} ]; then ls -F {}; else cat {}; fi'"
fi

alias finder="open ."

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
autoload -Uz compinit && compinit

if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
