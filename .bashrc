#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

### PROMPT PERSONALIZATION ###
# Special characters
# \h hostname up to the first .
# \t current time
# \u username
# \w cwd
# \W basename of cwd

RED=$(tput setaf 196)
BLUE=$(tput setaf 33)
GREEN=$(tput setaf 34)
WHITE=$(tput setaf 255)
RESET=$(tput sgr0)

PS1="\[$WHITE\](\t): " # Current time
PS1+="\[$RED\]\u " # User
PS1+="\[$WHITE\]at "
PS1+="\[$BLUE\]\h " # Host
PS1+="\[$WHITE\]in "
PS1+="\[$GREEN\]\w " # Woring directory
PS1+="\[$WHITE\]$  " # Separator
PS1+="\[$RED\]\n-> " 
PS1+="\[$RESET\]" # Reset color

export PS1;
