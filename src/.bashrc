#
# File:    .bashrc
# Version: 23.05.0
# Author:  BreadyX
#

[ -f "/etc/bashrc" ] && source '/etc/bashrc'

### SHELL OPTIONS ###
stty -ixon
shopt -s autocd
shopt -s histappend
shopt -s checkwinsize

### GLOBAL VARIABLES ###
export EDITOR="nvim"
export HISTFILE="$HOME/.cache/bash_history"
export LESSHISTFILE="/dev/null"
export LESS="$LESS -F"
export GPG_TTY=$(tty)

HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=2000

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

### ALIASES ###
[[ -r "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

### GIT PROMPT ###
if [ -f $HOME/.local/share/prompt/git-prompt.sh ]; then
    . $HOME/.local/share/prompt/git-prompt.sh
else
    __git_ps1() {
        PS1="$1$2 !no git prompt!"
    }
fi

### CONTAINER STUFF ###
if [[ -n $DISTROBOX_ENTER_PATH ]]; then
  export LANG=en_US.UTF-8
  export LC_NUMERIC=it_IT.UTF-8
  export LC_TIME=it_IT.UTF-8
  export LC_MONETARY=it_IT.UTF-8
  export LC_PAPER=it_IT.UTF-8
  export LC_MEASUREMENT=it_IT.UTF-8
fi

### PROMPT PERSONALIZATION ###
__prompt_command() {
    local dir_color="$(tput bold)$(tput setaf 12)"
    local reset=$(tput sgr0)
    local cont="∴" # in tty it will show up as a little square

    local pre_str=""
    local git_str="%s "
    local post_str="\[$reset\]\\\$ "

    [ -f /run/.containerenv ] && pre_str+="$cont "
    pre_str+="\[$dir_color\]\W\[$reset\] "

    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWSTASHSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWCOLORHINTS=1
    __git_ps1 "$pre_str" "$post_str" "$git_str"
}
PROMPT_COMMAND="__prompt_command"

### Added by various tools ###
export PATH="$PATH:/home/breadyx/.local/share/JetBrains/Toolbox/scripts"
[ -f "/home/breadyx/.cargo/env" ] && . "$HOME/.cargo/env"
