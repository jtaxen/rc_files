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
    docker-compose
    extract
    fzf
    git
    helm
    history
    kubectl
    microk8s
    npm
    tmux
    vi-mode
    web-search
    z
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for remote and local sessions
export EDITOR='vim'

# Vi mode settings
export KEYTIMEOUT=10

bindkey -M vicmd 'n' down-line-or-history
bindkey -M vicmd 'e' up-line-or-history
bindkey -M vicmd 'i' vi-forward-char
bindkey -M vicmd 'k' vi-repeat-search
bindkey -M vicmd 'K' vi-rev-repeat-search
bindkey -M vicmd 'p' vi-forward-word-end
bindkey -M vicmd 'P' vi-forward-blank-word-end
bindkey -M vicmd 'l' vi-insert
bindkey -M vicmd 'j' vi-put-after
bindkey -M vicmd 'J' vi-put-before
bindkey -M vicmd 'N' vi-join

# SSH
export SSH_KEY_PATH='~/.ssh/id_rsa'

alias :q=exit

# Aliases for spotifycli commands
alias sst='spotifycli --status'
alias sn='spotifycli --next && sleep 1 && sst'
alias spr='spotifycli --prev && sleep 1 && sst'
alias spp='spotifycli --playpause'

# fzf
#source /usr/share/fzf/completion.zsh
#source /usr/share/fzf/key-bindings.zsh

# Use fd instead of find as fzf engine
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f'

# Shortcut for activating virtualenvs
vactivate() {
    VENV_PATH="bin/activate"
    if [ -f $VENV_PATH ]; then
        source $VENV_PATH
    else
        VENV_PATH="venv/$VENV_PATH"
        if [ -f $VENV_PATH ]; then
            source $VENV_PATH
        else
            echo "No virtualenv found"
            return 1
        fi
    fi
    return 0
}

extras="$HOME/.rc_files/zsh_extras"
if [ -f $extras  ]; then
    source $extras
fi
