# -----------------------------------------------------------------------------
# Prompt
# -----------------------------------------------------------------------------

if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi

# -----------------------------------------------------------------------------
# Environment
# -----------------------------------------------------------------------------

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_ALT_C_COMMAND='fd --type d --strip-cwd-prefix --hidden --follow --exclude .git'

if command -v vivid >/dev/null 2>&1; then
    export LS_COLORS="$(vivid generate catppuccin-mocha)"
fi

# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------

if command -v eza >/dev/null 2>&1; then
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

# -----------------------------------------------------------------------------
# fzf
# -----------------------------------------------------------------------------

if command -v brew >/dev/null 2>&1; then
    FZF_DIR="$(brew --prefix)/opt/fzf"

    if [[ -d "$FZF_DIR" ]]; then
        [[ $- == *i* ]] && source "$FZF_DIR/shell/completion.zsh" 2>/dev/null
        source "$FZF_DIR/shell/key-bindings.zsh"

        # Custom directory-jump shortcut
        bindkey '^G' fzf-cd-widget
    fi
fi

# -----------------------------------------------------------------------------
# Completion
# -----------------------------------------------------------------------------

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

autoload -Uz compinit
compinit

# -----------------------------------------------------------------------------
# Plugins
# -----------------------------------------------------------------------------

if [[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# -----------------------------------------------------------------------------
# SSH
# -----------------------------------------------------------------------------

if [[ -n "$SSH_AUTH_SOCK" ]]; then
    ssh-add --apple-load-keychain -q 2>/dev/null
fi
