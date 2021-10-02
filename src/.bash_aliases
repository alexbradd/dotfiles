#
# File:    .bash_aliases
# Version: 21.10.0
# Author:  BreadyX
#

alias sudo='sudo ' # allow using aliases with sudo

### ls ###
alias ls="ls --color=auto"
alias la="ls -a"
alias ll="ls -la"

### dnf ###
alias S='sudo dnf install'
alias Sy='sudo dnf check-update'
alias Syu='sudo dnf upgrade'
alias Ss='dnf search'
alias Qi='dnf info'
alias Qr='sudo dnf needs-restarting'
alias R='sudo dnf remove'

### flatpak ###
alias fS='flatpak install'
alias fSs='flatpak search'
alias fSyu='flatpak update'
alias fR='flatpak remove'

### vim/neovim ###
alias nv="nvim"
alias v="vim"
alias sv="sudo vim"
alias nvSyu='nv +PlugUpdate +PlugUpgrade +CocUpdate'

### gpg ###
alias genpassword='gpg --armor --gen-random 1 10'
alias encrypt='gpg --sign --encrypt'
alias decrypt='gpg --decrypt'

# TODO: change to liking if on laptop
alias passwords='gpg --decrypt $HDD_MOUNT/codes/password.gpg'

### Directories ###
alias cdc='cd $HOME/projects'
alias cdd='cd $HOME/Documents'
alias cddw='cd $HOME/Downloads'

# TODO: change to liking if on laptop
alias cdhdd='cd $HDD_MOUNT'
alias cdD='cd $HDD_MOUNT/documents'
alias cds='cd $HDD_MOUNT/documents/uni'

