#
# File:    .bashrc
# Version: 21.10.0
# Author:  BreadyX
#

[ -f "/etc/bashrc" ] && source '/etc/bashrc'

### SHELL OPTIONS ###
stty -ixon
shopt -s autocd
shopt -s histappend
shopt -s checkwinsize

### GLOBAL VARIABLES ###
export EDITOR="nvim"
export HISTFILE="$HOME/.cache/bash_history"
export LESSHISTFILE="/dev/null"
export GIT_HUD_GLYPH="Y"

export GPG_TTY=$(tty)

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# TODO: delete if on laptop
export HDD_MOUNT="/media/hdd"

### ALIASES ###
[[ -r "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

### FUNCTION DEFINITIONS ###
function notes() {
    local h="$HDD_MOUNT/documents/uni/uni-notes/"

    case "$1" in
        -d)
            local p="$h/$2"
            if [ -n "$2" ] && [ "${2:0:1}" != '.' ] && \
                    [ "${2:0:1}" != '/' ] && [ -d "$p" ]; then
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

### PROMPT PERSONALIZATION ###
BLUE=$(tput setaf 12)
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)
CONTAINER_PREFIX="⬢ "

if [ "$TERM" = "linux" ]; then
    BLUE=$(tput setaf 4)
    CONTAINER_PREFIX="<> "
fi

PS1=""
if [ -f /run/.containerenv ]; then
    PS1+="$CONTAINER_PREFIX"
fi
PS1+="\[$RESET\][\[$BLUE\]\u@\h:\W\[$RESET\]]"
which git-hud 1>/dev/null 2>&1 && PS1+=" \[$GREEN\]\$(git-hud -C -D)"
PS1+="\[$RESET\]\$ "
export PS1;

