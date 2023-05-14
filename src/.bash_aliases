#
# File:    .bash_aliases
# Version: 23.05.0
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

### Package manager ###
upgrade() {
  echo "### System packages ###"
  sudo zypper dup
  echo "### Flatpak ###"
  flatpak update
}

### vim/neovim ###
alias nv="nvim"
alias v="vim"
alias sv="sudo vim"

### Configs ###
# swaycfg() {
#   local cfg_root="$HOME/.config/sway"
#   pushd $cfg_root
#   if [ -z "$1" ]; then $EDITOR "$cfg_root/config";
#   else $EDITOR "$cfg_root/config.d/$1"; fi
#   popd
# }
# waybarcfg() {
#   local cfg_root="$HOME/.config/waybar"
#   pushd $cfg_root
#   $EDITOR "$cfg_root/config"
#   popd
# }

### Directories ###
UNI_ROOT="$HOME/Documents/uni/compsci-notes/"
cdd()  { cd "$HOME/Documents/$1"; }
cddw() { cd "$HOME/Downloads/$1"; }
cdc()  { cd "$HOME/projects/$1"; }
cds()  { cd "$UNI_ROOT/$1"; }

### Misc ###
# Courtesy of Ubuntu's default bashrc
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias bt=bluetoothctl
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
