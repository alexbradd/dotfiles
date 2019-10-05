#
# File: ~/.bashrc
# Version: 1.0
# Author: BreadyX
#
# Scripts sourced by bash at each prompt redraw. It contains all the prompt
# customization and it integrates all the other utilities to give all the useful
# info at a glance
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source basic bash config
[[ -f /etc/bashrc ]] && source /etc/bashrc

# Disable ^S / ^Q
stty -ixon

# Move HISTFILE
export HISTFILE=~/.cache/bash_history

shopt -s autocd
shopt -s histappend
shopt -s checkwinsize

### INCLUDE USER BIN ###
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
    export PATH
fi

### ALIASES ###
# Misc
alias la="ls -a --color=auto"
alias ll="ls -la --color=auto"
alias cls="clear"
alias darkscrn="xset dpms force off"
[ -e "/usr/bin/trash" ] && alias safe-rm="trash"

# Editors
alias visu="sudo vim"
alias nv="nvim"
alias v="vim"

# Directories
alias cds='cd ~/Documents/School/'
alias cdc='cd ~/Code/'

# dnf aliases
alias install="sudo pacman -S"
alias update="sudo pacman -Syu"
alias remove="sudo pacman -Rns"

### PROMPT PERSONALIZATION ###
# Special characters
# \h hostname up to the first .
# \A current time in HH:MM
# \u username
# \w cwd
# \$ command separator

# Colors and stuff
RED=$(tput setaf 1)
BLUE=$(tput setaf 12)
GREEN=$(tput setaf 2)

BOLD=$(tput bold)
ITALICS=$(tput sitm)

RESET=$(tput sgr0)

# Current directory
PS1="\[$RESET\]\u\[$BLUE\]\[$BOLD\] \W \[$RESET\]"

# Git hud
PS1+="\[$GREEN\]\$(git-hud)\[$RESET\]\n"

# Arrow
PS1+=" \[$RED\]➜\[$RESET\] "

export PS1;

### AUTORUN ###
cowsay "Hi, it's $(date '+%H:%M %d/%m/%Y'). Have a great terminal session!"
