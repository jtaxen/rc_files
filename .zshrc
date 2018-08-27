# Path to oh-my-zsh installation.
export ZSH=/home/jacobtn/.oh-my-zsh

ZSH_THEME="jacob"

# Oh-my-zsh plugins
plugins=(
    extract
    git
    z
    zshmarks
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for remote and local sessions
export EDITOR='vim'

# SSH
export SSH_KEY_PATH='~/.ssh/id_rsa'

alias :q=exit
