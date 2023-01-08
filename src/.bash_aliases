#
# File:    .bash_aliases
# Version: 23.01.0
# Author:  BreadyX
#
alias sudo='sudo ' # allow using aliases with sudo

### ls ###
alias ls="ls --color=auto"
alias la="ls -A"
alias ll="ls -lA"

### dnf ###
alias S='sudo pacman -S'
alias Sy='sudo pacman -Sy'
alias Syu='sudo pacman -Syu'
alias Ss='pacman -Ss'
alias Qi='pacman -Qi'
alias R='sudo pacman -Rns'

### flatpak ###
alias fS='flatpak install'
alias fSs='flatpak search'
alias fSyu='flatpak update'
alias fR='flatpak remove'

### vim/neovim ###
alias nv="nvim"
alias v="vim"
alias sv="sudo vim"
alias nvSyu='nv +PackerUpdate +TSUpdate'

### gpg ###
alias genpassword='gpg --armor --gen-random 1 10'
alias encrypt='gpg --sign --encrypt'
alias decrypt='gpg --decrypt'
alias passwords='gpg --decrypt $DOCUMENTS_ROOT/password.gpg'

### Configs ###
swaycfg() {
  local cfg_root="$HOME/.config/sway"
  pushd $cfg_root
  if [ -z "$1" ]; then $EDITOR "$cfg_root/config";
  else $EDITOR "$cfg_root/config.d/$1"; fi
  popd
}
waybarcfg() {
  local cfg_root="$HOME/.config/waybar"
  pushd $cfg_root
  $EDITOR "$cfg_root/config"
  popd
}

### Directories ###
UNI_ROOT="$HOME/Documents/uni/compsci-notes/"
cdd()  { cd "$HOME/Documents/$1"; }
cddw() { cd "$HOME/Downloads/$1"; }
cdc()  { cd "$HOME/projects/$1"; }
cds()  { cd "$UNI_ROOT/$1"; }

