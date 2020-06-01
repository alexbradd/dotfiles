#
# File:    .bashrc
# Version: 20.06.0
# Author:  BreadyX
#

[[ -r /etc/bashrc ]] && source /etc/bashrc
[[ $- != *i* ]] && return

stty -ixon
shopt -s autocd
shopt -s histappend
shopt -s checkwinsize

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
    export PATH
fi

[[ -r "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

### PROMPT PERSONALIZATION ###
GREEN=$(tput setaf 2)
CYAN=$(tput setaf 6)
BLUE=$(tput setaf 12)
BOLD=$(tput bold)
RESET=$(tput sgr0)

PS1="\[$RESET\][\[$BLUE\]\u@\h:\W\[$RESET\]]"
which bat-hud 1>/dev/null 2>&1 && PS1+=" \[$CYAN\]\$(bat-hud)"
PS1+=" \[$GREEN\]\$(git-hud -C)"
PS1+="\[$RESET\]\$ "
export PS1;

