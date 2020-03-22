#
# File:    .bashrc
# Version: 20.03.0
# Author:  BreadyX
#

# If not running interactively, don't do anything
[[ -r /etc/bashrc ]] && source /etc/bashrc
[[ $- != *i* ]] && return

export HISTFILE="$HOME/.cache/bash_history"
stty -ixon
shopt -s autocd
shopt -s histappend
shopt -s checkwinsize

export GPG_TTY="$(tty)"
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
    export PATH
fi

[[ -r "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

### PROMPT PERSONALIZATION ###
# Special characters
# \h hostname up to the first .
# \A current time in HH:MM
# \u username
# \w cwd
# \$ command separator

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
BOLD=$(tput bold)
RESET=$(tput sgr0)

PS1="\[$RESET\]\$(date '+%H:%M') \[$BOLD\]\[$YELLOW\]\u@\h \[$BLUE\]\W\[$RESET\] "
PS1+="\[$GREEN\]| \$(git-hud) | \$(bat-hud) | \$(corona)\n"
PS1+="\[$RESET\]> "
export PS1;

### AUTORUN ###
# cowsay "Hi, it's $(date '+%H:%M %d/%m/%Y')"
