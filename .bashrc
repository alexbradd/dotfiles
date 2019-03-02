#
# File: ~/.bashrc
# Version: 12.2018.8
# Author: BreadyX
#
# Scripts sourced by bash at each prompt redraw. It contains all the prompt customization and
# it integrates all the other utilities to give all the useful info at a glance
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s autocd
shopt -s histappend
shopt -s checkwinsize
tabs 5

### ALIASES ###
# Misc
alias ls="ls -a --color=auto"
alias cls="clear"
alias darkscrn="xset dpms force off"

# Pacman aliases
alias install="sudo pacman -S"
alias update="sudo pacman -Syu"
alias remove="sudo pacman -R"

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

# PS1="\n\[$WHITE\](\A) - " # Current time
# PS1+="\[$RED\]\u " # User
# PS1+="\[$WHITE\]at "
# PS1+="\[$BLUE\]\[$ITALICS\]\h " # Host
# PS1+="\[$WHITE\]in "
# PS1+="\[$GREEN\]\[$ITALICS\]\w " # Working directory
# PS1+="\[$RESET\]" #| \$(autorm -c)"
# PS1+="| \[$ORANGE\]\$(gitsum 4)"
# PS1+="\[$RESET\]\n\$ "

PS1="[\[$BLUE\]\[$BOLD\] \w \[$RESET\]] " # Current directory
PS1+="\[$GREEN\]\$(gitsum 4) "
PS1+="\[$RED\]➜ \[$RESET\]"

export PS1;

### AUTORUN ###
echo -e "Hi Alex, it is $(date +%H:%M) $(date +%d/%m/%Y).\nHave a great terminal session!" | cowsay # Greet me at every login
