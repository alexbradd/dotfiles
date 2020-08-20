#
# File:    .bash_aliases
# Version: 20.08.0
# Author:  BreadyX
#

# Programs
alias la="ls -a --color=auto"
alias ll="ls -la --color=auto"
alias cls="clear"
alias nv="nvim"
alias v="vim"
alias sv="sudo vim"
alias g="git"

# Package manager
alias S='sudo dnf install'
alias Sy='sudo dnf check-update'
alias Syu='sudo dnf upgrade'
alias Ss='dnf search'
alias Qi='dnf info'
alias R='sudo dnf remove'
alias fS='flatpak install'
alias fSs='flatpak search'
alias fSyu='flatpak update'
alias fR='flatpak remove'
alias fRr='flatpak run'

# Directories
alias cdc='cd ~/Code/'
alias cdd='cd ~/Documents'
alias cds='cd ~/Documents/school/'
alias cddw='cd ~/Downloads'

# Misc
alias dl-song='youtube-dl -x --audio-quality 256k --default-search ytsearch -o "~/Music/%(title)s.%(ext)s"'
