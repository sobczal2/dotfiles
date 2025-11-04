export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="funky"

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
    rust
    sudo
)

source $ZSH/oh-my-zsh.sh

# fastfetch. Will be disabled if above colorscript was chosen to install
fastfetch

# Set-up icons for files/folders in terminal
alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_ALT_C_OPTS="--preview 'ls -p --color=always {} | head -200' --preview-window=right:50%"
if [[ -n "$TMUX" ]]; then
  export FZF_TMUX_OPTS='-p 80%,60%'   # 80% width, 60% height
fi

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sobczal/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sobczal/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/sobczal/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sobczal/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# go
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH="$PATH:$(go env GOPATH)/bin"

# zsh compdump location
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# AppImage
export PATH="$PATH:/home/sobczal/Applications"

# scripts
export PATH="$PATH:/home/sobczal/bin"

# gradle
export PATH=$PATH:/opt/gradle/gradle-7.6.4/bin
