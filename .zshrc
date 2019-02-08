# Path to oh-my-zsh installation.
if [[ -d /home/$USER/.oh-my-zsh ]]; then
    export ZSH=/home/$USER/.oh-my-zsh
elif [[ -d /Users/$USER/.oh-my-zsh ]]; then
    export ZSH=/Users/$USER/.oh-my-zsh
else
    echo "Path to oh-my-zsh installation cannot be found."
    exit 1
fi

ZSH_THEME="jacob"
ZSH_TMUX_AUTOSTART=true

# Oh-my-zsh plugins
plugins=(
    docker
    extract
    git
    history
    tmux
    z
    zshmarks
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for remote and local sessions
export EDITOR='vim'

# SSH
export SSH_KEY_PATH='~/.ssh/id_rsa'

alias :q=exit

# Aliases for spotifycli commands
alias sst='spotifycli --status'
alias sn='spotifycli --next && sleep 1 && sst'
alias spr='spotifycli --prev && sleep 1 && sst'
alias spp='spotifycli --playpause'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
