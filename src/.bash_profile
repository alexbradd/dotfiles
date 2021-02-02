#
# File:    .bash_profile
# Version: 21.02.0
# Author:  BreadyX
#

which cowsay 1>/dev/null 2>&1 && cowsay "Welcome!"

[ -f "/etc/profile" ] && source "/etc/profile"
[ -r "$HOME/.bashrc" ] && source "$HOME/.bashrc"
