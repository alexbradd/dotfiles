#
# File:    .bashrc
# Version: 23.09.0
# Author:  BreadyX
#

### SHELL OPTIONS ###
stty sane
shopt -s histappend cdspell dirspell

### GLOBAL VARIABLES ###
export EDITOR="nvim"
export VISUAL="nvim"

export LESSHISTFILE="/dev/null"
export LESS="$LESS -F"

export HISTFILE="$HOME/.cache/bash_history"
export HISTCONTROL=ignoredups:ignorespace
export HISTSIZE=1000
export HISTFILESIZE=2000

export GPG_TTY=$(tty)

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

### ALIASES ###
[ -r "$HOME/.bash_aliases" ] && source "$HOME/.bash_aliases"

### PROMPT PERSONALIZATION ###
if [[ -f $HOME/.local/share/prompt/git-prompt.sh ]]; then
  . $HOME/.local/share/prompt/git-prompt.sh
else
  __git_ps1() {
    PS1="$1 ! $2 "
  }
fi

short_pwd() {
  ( IFS=/
    set $PWD
    if test $# -le 3 ; then
      echo "$PWD"
    else
      eval echo \"\${$(($#-1))}/\${$#}\"
    fi )
}

__prompt_command() {
  local bold="$(tput bold)"
  local reset=$(tput sgr0)
  local cont="∴" # in tty it will show up as a little square

  local pre_str=""
  local git_str="%s|"
  local post_str="\[$reset\]\u@\h:\$(short_pwd)>\[$reset\] "

  [ -f /run/.containerenv ] && pre_str+="$cont|"

  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWSTASHSTATE=1
  GIT_PS1_SHOWUNTRACKEDFILES=1
  GIT_PS1_SHOWCOLORHINTS=1
  __git_ps1 "$pre_str" "$post_str" "$git_str"
}
PROMPT_COMMAND="__prompt_command"
