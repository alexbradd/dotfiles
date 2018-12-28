#
# File: ~/.bash_profile
# Version: 12.2018.2
# Author: BreadyX
#
# Script sourced by bash at each login. Sets env variables, adds user's private bin 
# folders and sources the bashrc if exists
#

### EXPORTS ###
export EDITOR="nvim"
export GPG_TTY=$(tty)s

### INCLUDE USER BIN ###
if [ -d "$HOME/.local/bin" ] ; then PATH="$HOME/.local/bin:$PATH"; export PATH; fi

### SOURCE BASHRC ###
[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"
