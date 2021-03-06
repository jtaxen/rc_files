# ZSH Theme - My own nice theme. Put in ~/.oh-my-zsh/themes/

### CONSTANTS

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ● "

NCOLOR="green"

### FUNCTIONS

#
# hostmane_in_prompt
#
# If the current session is an SSH session, show the hostname in the prompt.
#
hostname_in_prompt() {
    if [ $SSH_CLIENT ]; then
        NCOLOR="red"
        echo "@%m"
    fi
}

#
# git_custom_info
#
# Show branch name to the right if the current working directory is a Git repository. Show a red flag if the repository is dirty.
#
git_custom_info() {
    local branch=$(git_current_branch)
    if [ -n "$branch" ]; then
        echo "$(parse_git_dirty)%{$reset_color%}$ZSH_THEME_GIT_PROMPT_PREFIX$(git_current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
    fi
}

#
# screen_indicator
#
# Show a green star and the number of the window if the current session is running screen.
#
screen_indicator() {
    if [ -n "$STY" ]; then
        echo "%{$fg[green]%}✻ $WINDOW%{$reset_color%}"
    fi
}

#
# tmux indicator
#
# Show the window and pane number if the current session is running tmux.
#
tmux_indicator() {
    if [ -n "$TMUX" ]; then
        echo "%{$fg[green]%}⌘ $(echo $TMUX_PANE | sed 's/%//g' )%{$reset_color%}"
    fi
}

#
# Vi model indicator
#
# Show an indicator if the vi mode is activated and in normal mode
#
vi_mode_indicator() {
    MODE_INDICATOR="%{$fg_bold[red]%}<%{$fg[red]%}<<%{$reset_color%}"
    echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/} "
}

### PROMPTS

# Left prompts
PROMPT='%{$fg[$NCOLOR]%}%n$(hostname_in_prompt)%{$fg[green]%}%{$reset_color%}: %2d \
%{$fg[red]%}%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'

# Right prompts
RPS1='$(git_custom_info)$(vi_mode_indicator)$(screen_indicator)$(tmux_indicator)'
