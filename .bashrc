#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# Special characters
# \h hostaname up to the first .
# \t current time
# \u username
# \w cwd
# \W basename of cwd

PS1="\[$(tput setaf 160)\]\u " ## USER
PS1+="\[$(tput setaf 21)\]at \h " ## HOST
PS1+="\[$(tput setaf 2)\]in \W " ## WD
PS1+="\[$(tput setaf 160)\]$ " ## SEPARATOR
PS1+="\[$(tput sgr0)\]" ##REST COLOR

export PS1;
