#
# File:    .bash_profile
# Version: 20.06.1
# Author:  BreadyX
#

export EDITOR="nvim"			# Set deafult editor
export BROWSER="firefox"		# Set default browser
export READER="evince"			# Set default reader (pdf and such)

export GPG_TTY=$(tty)			# Make gpg behave

export LANG="en_US.UTF-8"
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

export HISTFILE="$HOME/.cache/bash_history"
export LESSHISTFILE="/dev/null"

export GIT_HUD_GLYPH="Y"
export BAT_HUD_GLYPH="Y"

[ -r "$HOME/.bashrc" ] && source "$HOME/.bashrc"
