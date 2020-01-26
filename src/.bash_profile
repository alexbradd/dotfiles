#
# File:    .bash_profile
# Version: 20.01.0
# Author:  BreadyX
#

export EDITOR="nvim"			# Set deafult editor
export BROWSER="firefox"		# Set default browser
export READER="evince"			# Set default reader (pdf and such)
export GPG_TTY=$(tty)			# Set GPG_TTY to so that gpg doesn't freak out

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

export GIT_HUD_GLYPH="Y"

[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"
