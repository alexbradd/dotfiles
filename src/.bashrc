#
# File:    .bashrc
# Version: 20.11.0
# Author:  BreadyX
#

export EDITOR="nvim"      # Set deafult editor
export BROWSER="firefox"  # Set default browser
export READER="evince"    # Set default reader (pdf and such)

# export LANG="en_US.UTF-8"
# export LC_CTYPE="en_US.UTF-8"
# export LC_NUMERIC="it_IT.UTF-8"
# export LC_TIME="it_IT.UTF-8"
# export LC_COLLATE="it_IT.UTF-8"
# export LC_MONETARY="it_IT.UTF-8"
# export LC_MESSAGES="en_US.UTF-8"
# export LC_PAPER="en_US.UTF-8"
# export LC_NAME="it_IT.UTF-8"
# export LC_ADDRESS="it_IT.UTF-8"
# export LC_TELEPHONE="it_IT.UTF-8"
# export LC_MEASUREMENT="it_IT.UTF-8"
# export LC_IDENTIFICATION="en_US.UTF-8"
# export LC_ALL=

export HISTFILE="$HOME/.cache/bash_history"
export LESSHISTFILE="/dev/null"

export GIT_HUD_GLYPH="Y"
export BAT_HUD_GLYPH="Y"

[[ $- != *i* ]] && return

stty -ixon
shopt -s autocd
shopt -s histappend
shopt -s checkwinsize

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
  export PATH
fi

[[ -r "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

### PROMPT PERSONALIZATION ###
GREEN=$(tput setaf 2)
CYAN=$(tput setaf 6)
BOLD=$(tput bold)
RESET=$(tput sgr0)

if [ "$TERM" = "linux" ]; then
  BLUE=$(tput setaf 4)
else
  BLUE=$(tput setaf 12)
fi

PS1="\[$RESET\][\[$BLUE\]\u@\h:\W\[$RESET\]]"
which bat-hud 1>/dev/null 2>&1 && PS1+=" \[$CYAN\]\$(bat-hud)"
which git-hud 1>/dev/null 2>&1 && PS1+=" \[$GREEN\]\$(git-hud -C)"
PS1+="\[$RESET\]\$ "
export PS1;

