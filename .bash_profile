#
# File: ~/.bash_profile
# Version: 4.2019.0
# Author: BreadyX
#
# Script sourced by bash at each login. Sets env variables, adds user's private bin
# folders and sources the bashrc if exists
#

### EXPORTS ###
export EDITOR="nvim"			# Set deafult editor
export BROWSER="firefox"			# Set default browser
export READER="evince"			# Set default reader (pdf and such)
export GPG_TTY=$(tty)			# Set GPG_TTY to so that gpg doesn't freak out
# Locale variables
export LANG=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"
export LC_NUMERIC="it_IT.UTF-8"
export LC_TIME="it_IT.UTF-8"
export LC_COLLATE="it_IT.UTF-8"
export LC_MONETARY="it_IT.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LC_NAME="it_IT.UTF-8"
export LC_ADDRESS="it_IT.UTF-8"
export LC_TELEPHONE="it_IT.UTF-8"
export LC_MEASUREMENT="it_IT.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"
export LC_ALL=

### SOURCE BASHRC ###
[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"
