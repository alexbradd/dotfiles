#
# File: ~/.bashrc
# Version: 12.2018.7
# Author: BreadyX
#
# Scripts sourced by bash at each prompt redraw. It contains all the prompt customization and
# it integrates all the other utilities to give all the useful info at a glance
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

tabs 5

### ALIASES ###
# Misc
alias ls="ls -a --color=auto"
alias cls="clear"
alias vimrc="nvim ~/.config/nvim/init.vim"
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
RED=$(tput setaf 196)
ORANGE=$(tput setaf 166)
BLUE=$(tput setaf 33)
GREEN=$(tput setaf 34)
WHITE=$(tput setaf 255)

ITALICS=$(tput sitm)
TAB=$(echo -e "\t")

RESET=$(tput sgr0)

PS1="\n\[$WHITE\](\A) - " # Current time
PS1+="\[$RED\]\u " # User
PS1+="\[$WHITE\]at "
PS1+="\[$BLUE\]\[$ITALICS\]\h " # Host
PS1+="\[$WHITE\]in "
PS1+="\[$GREEN\]\[$ITALICS\]\w " # Working directory
PS1+="\[$RESET\]| \$(autorm -c)"
PS1+="\n${TAB}\[$ORANGE\]\$(gitsum)"
PS1+="\[$RESET\]\n\$ "

export PS1;
