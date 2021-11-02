#
# File:    .bashrc
# Version: 21.11.0
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

if [ -f $HOME/.local/share/prompt/git-prompt.sh ]; then
    . $HOME/.local/share/prompt/git-prompt.sh
else
    __git_ps1() {
        echo 'Warning: git-prompt.sh has not been found'
        PS1="$1$2"
    }
fi

### PROMPT PERSONALIZATION ###
__prompt_command() {
    local dir_color="$(tput bold)$(tput setaf 12)"
    local reset=$(tput sgr0)
    local cont="∴" # in tty it will show up as a little square

    local pre_str=""
    local git_str="%s "
    local post_str="\[$reset\]\\\$ "

    [ -f /run/.containerenv ] && pre_str+="$cont "
    pre_str+="\[$dir_color\]\W\[$reset\] "

    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWSTASHSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWCOLORHINTS=1
    __git_ps1 "$pre_str" "$post_str" "$git_str"
}
PROMPT_COMMAND="__prompt_command"

