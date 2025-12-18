########## Basic environment ##########
export LANG=en_US.UTF-8

# Editor priority: nvim → vim → vi → nano
if command -v nvim >/dev/null 2>&1; then
  export EDITOR="nvim"
elif command -v vim >/dev/null 2>&1; then
  export EDITOR="vim"
elif command -v vi >/dev/null 2>&1; then
  export EDITOR="vi"
else
  export EDITOR="nano"
fi

export LLVM_HOME="/opt/homebrew/opt/llvm"
export PATH="$LLVM_HOME/bin:$PATH"
export LDFLAGS="-L$LLVM_HOME/lib"
export CPPFLAGS="-I$LLVM_HOME/include"


########## Completion system ##########
autoload -Uz compinit
compinit

########## Useful shell options ##########
setopt auto_cd
setopt interactive_comments
setopt no_beep

########## History settings ##########
HISTSIZE=5000
SAVEHIST=5000
HISTFILE="$HOME/.zsh_history"
setopt share_history
setopt hist_ignore_dups

########## Git aliases ##########
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gco="git checkout"

########## Other aliases ##########
alias ll="ls -lah"

########## Plugins (safe if missing) ##########
if [ -f "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

if [ -f "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

########## Git branch & prompt ##########
autoload -Uz vcs_info

# Enable git backend for vcs_info
zstyle ':vcs_info:*' enable git
# Show branch name in green: (main)
zstyle ':vcs_info:git:*' formats '%F{green}(%b)%f'

# Run before each prompt: update vcs_info
precmd() {
  vcs_info
}

# Prompt:
# Line 1: user@host  path  (branch)  [error if any]
# Line 2: arrow
setopt prompt_subst
PROMPT='%F{brightwhite}%n@%m%f %F{white}%~%f ${vcs_info_msg_0_}%(?.. %F{red}✘ %?%f)
%F{yellow}➜%f '

########## Optional: fzf integration (only if installed) ##########
if command -v fzf >/dev/null 2>&1; then
  # Reasonable defaults for file finding
  # Tries `fd` if available, falls back to `find`
  if command -v fd >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
  else
    export FZF_DEFAULT_COMMAND='find . -type f 2>/dev/null'
  fi

  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

  # Try to source fzf’s zsh keybindings from common locations
  for f in \
    "/usr/share/doc/fzf/examples/key-bindings.zsh" \
    "/usr/share/fzf/key-bindings.zsh" \
    "/opt/homebrew/opt/fzf/shell/key-bindings.zsh" \
    "/usr/local/opt/fzf/shell/key-bindings.zsh"
  do
    [ -f "$f" ] && source "$f" && break
  done

  # If the widget exists, bind Ctrl-R to fzf history search
  if typeset -f fzf-history-widget >/dev/null 2>&1; then
    bindkey '^R' fzf-history-widget
  fi
fi
########## End of .zshrc ##########
