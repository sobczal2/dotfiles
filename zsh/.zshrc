export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="funky"

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
    rust
    ssh-agent
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
export GOPATH=$HOME/go
export PATH="$PATH:$(go env GOPATH)/bin"

# ssh appent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# zsh compdump location
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# AppImage
export PATH="$PATH:/home/sobczal/Applications"
