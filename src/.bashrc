#
# File:    .bashrc
# Version: 21.05.0
# Author:  BreadyX
#

[ -f "/etc/bashrc" ] && source '/etc/bashrc'

### GLOBAL VARIABLES ###
export EDITOR="nvim"
export HISTFILE="$HOME/.cache/bash_history"
export LESSHISTFILE="/dev/null"
export GIT_HUD_GLYPH="Y"
export BAT_HUD_GLYPH="Y"

export GPG_TTY=$(tty)

if [ -d '/media/hdd' ]; then
	export HDD_MOUNT="/media/hdd"
else
	export HDD_MOUNT=
fi

[[ $- != *i* ]] && return

### SHELL OPTIONS ###
stty -ixon
shopt -s autocd
shopt -s histappend
shopt -s checkwinsize

### PATH ###
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
  export PATH
fi

### ALIASES ###
[[ -r "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

### FUNCTION DEFINITIONS ###
function notes() {
  local h="$HDD_MOUNT/documents/uni/uni-notes/"

  case "$1" in
    -d)
      local p="$h/$2"
      if [ -n "$2" ] && [ "${2:0:1}" != '.' ] && [ "${2:0:1}" != '/' ] && \
          [ -d "$p" ]; then
        cd "$p"
      else
        echo "Invalid directory name '$2'"
      fi ;;
    -l)
      ls $h/* --width=1 --color=never --directory | xargs basename -a ;;
    -h)
      echo "Usage: notes [-d dir|-l|-h]" ;;
    *)
      if [ -n "$1" ]; then
        echo "Invalid argument '$1'"
      else
        cd "$h"
      fi ;;
  esac
}

function passwords() {
  local home_f="$HOME/Documents/password.gpg"
  local hdd_f="$HDD_MOUNT/codes/password.gpg"

  echo "--> Trying '$home_f'..."
  gpg --decrypt "$home_f" \
    && return \
    || echo "--> '$home_f' not found"

  echo ""
  echo "--> Trying '$hdd_f'..."
  gpg --decrypt "$hdd_f" \
    && return \
    || echo "--> '$hdd_f' not found"

  echo "--> 'password.gpg' not found in known locations..."
}

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
which git-hud 1>/dev/null 2>&1 && PS1+=" \[$GREEN\]\$(git-hud -C -D)"
PS1+="\[$RESET\]\$ "
export PS1;

