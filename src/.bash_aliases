#
# File:    .bash_aliases
# Version: 21.02.0
# Author:  BreadyX
#

# Programs
alias ls="ls --color=auto"
alias la="ls -a"
alias ll="ls -la"

alias cls="clear"

alias nv="nvim"
alias v="vim"
alias sv="sudo vim"

# Package managers:
alias S='sudo dnf install'
alias Sy='sudo dnf check-update'
alias Syu='sudo dnf upgrade'
alias Ss='dnf search'
alias Qi='dnf info'
alias Qr='sudo dnf needs-restarting'
alias R='sudo dnf remove'

alias fS='flatpak install'
alias fSs='flatpak search'
alias fSyu='flatpak update'
alias fR='flatpak remove'
alias fRr='flatpak run'

alias nvSyu='nv +PlugUpdate +PlugUpgrade'

# Directories
alias cdc='cd $HOME/src/'
alias cdd='cd $HOME/Documents'
alias cddw='cd $HOME/Downloads'

alias cd_hdd='cd $HDD_MOUNT'
alias cds_hdd='cd $HDD_MOUNT/documents/uni'

# Misc
alias gen-key='gpg --armor --gen-random 1 10'
alias decrypt='gpg --decrypt'
