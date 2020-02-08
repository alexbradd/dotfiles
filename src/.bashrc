#
# File:    .bashrc
# Version: 20.02.0
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

### ALIASES ###
# Misc
alias la="ls -a --color=auto"
alias ll="ls -la --color=auto"
alias cls="clear"

# Editors
alias visu="sudo vim"
alias nv="nvim"
alias v="vim"

# Directories
alias cds='cd ~/Documents/School/'
alias cdc='cd ~/Code/'

### PROMPT PERSONALIZATION ###
# Special characters
# \h hostname up to the first .
# \A current time in HH:MM
# \u username
# \w cwd
# \$ command separator

RED=$(tput setaf 1)
BLUE=$(tput setaf 12)
GREEN=$(tput setaf 2)
BOLD=$(tput bold)
RESET=$(tput sgr0)

# Current directory
PS1="\[$RESET\]\u \[$BLUE\]\[$BOLD\]\W\[$RESET\] "
PS1+="\[$GREEN\]\$(git-hud)\n"
PS1+="\[$RED\]→ \[$RESET\] "
export PS1;

### AUTORUN ###
cowsay "Hi, it's $(date '+%H:%M %d/%m/%Y')"
