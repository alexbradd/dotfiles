#!/bin/sh

################################################################################
# Important directories
################################################################################
mkdir -p $HOME/.config
mkdir -p $HOME/.local/{share,bin}
mkdir -p $HOME/.cache

################################################################################
# Setup shell env
################################################################################
cat << EOF > $HOME/.bashrc
# Source host rc
source /run/host/home/bred/.bashrc

### Extra config
EOF

[ -f $HOME/.profile ] && rm $HOME/.profile
[ -f $HOME/.bash_profile ] && rm $HOME/.bash_profile
cat << EOF > $HOME/.bash_profile
# Source host rc
source /run/host/home/bred/.bash_profile

### Extra config
EOF

ln -s /run/host/home/bred/.bash_aliases $HOME/.bash_aliases
ln -s /run/host/home/bred/.bash_logout $HOME/.bash_logout
ln -s /run/host/home/bred/.local/share/prompt $HOME/.local/share/prompt

################################################################################
# Setup secrets
################################################################################
ln -s /run/host/home/bred/.gnupg $HOME/.gnupg
ln -s /run/host/home/bred/.ssh $HOME/.ssh

################################################################################
# Setup git
################################################################################
ln -s /run/host/home/bred/.gitconfig $HOME/.gitconfig

################################################################################
# Setup neovim config
################################################################################
mkdir -p $HOME/.config/nvim
ln -s /run/host/home/bred/.config/nvim $HOME/.config/nvim

