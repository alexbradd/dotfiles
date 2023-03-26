#
# File:    .bash_aliases
# Version: 23.04.0
# Author:  BreadyX
#
alias sudo='sudo ' # allow using aliases with sudo

### ls ###
alias ls="ls --color=auto"
alias la="ls -A"
alias ll="ls -lA"

### Package managers ###
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
alias bt=bluetoothctl
