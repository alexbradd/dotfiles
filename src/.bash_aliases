#
# File:    .bash_aliases
# Version: 23.09.0
# Author:  BreadyX
#
alias sudo='sudo ' # allow using aliases with sudo

### ls ###
# Courtesy of Ubuntu's default bashrc
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
fi
alias la="ls -A"
alias ll="ls -lA"

### vim/neovim ###
alias nv="nvim"
alias v="vim"

### Directories ###
cdd()  { cd "$HOME/Documents/$1"; }
cddw() { cd "$HOME/Downloads/$1"; }
cdc()  { cd "$HOME/projects/$1"; }

export _UNI_ROOT="$HOME/Documents/uni/compsci-notes" # this way we can redefine where it is
cds()  { cd "$UNI_ROOT/$1"; }

### Misc ###
alias d="distrobox enter"

### Some function-y alises ###
exit_gnome() {
  busctl call org.freedesktop.login1 /org/freedesktop/login1 org.freedesktop.login1.Manager TerminateSession s $(loginctl show-user $UID --property=Sessions --value)
}
crlf_begone() {
  if [ $1 = '--unsafe' ]; then
    local args=($@)
    for f in ${args[@]:1}; do
      echo ">>> Really hammering $f, at your own risk"
      sed -i 's//\n/g' "$f"
    done
  else
    for f in $@; do
        echo ">>> Fixing $f"
        sed -i 's/$//' "$f"
    done
  fi
}
