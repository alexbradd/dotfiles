#!/bin/sh

[ -f $HOME/.config/init_done ] && {
	echo "Already set up"
	exit 0
}

echo "Setting up home using $1"

################################################################################
# Setup shell env
################################################################################
cat <<EOF >$HOME/.bashrc
# For some reason, distrobox containers started from the "Containers" tab in
# Ptyxis don't read the profile but those started with distrobox-enter do.
# Do this to ensure that profiles are always read
[ -z "\$USER_PROFILEREAD" ] && source \$HOME/.bash_profile

# Source host rc
source $1/.bashrc

### Extra config
EOF

[ -f $HOME/.profile ] && rm $HOME/.profile
[ -f $HOME/.bash_profile ] && rm $HOME/.bash_profile
cat <<EOF >$HOME/.bash_profile
# Source host profile
source $1/.bash_profile

### Extra config
EOF
cat <<EOF >$HOME/.profile
source $HOME/.bash_profile
EOF

cat <<EOF >$HOME/.bash_aliases
# Source host aliases
OTHER_HOME="$1"
source $1/.bash_aliases

### Extra config
EOF

mkdir -p $HOME/.local/share
ln -sf $1/.local/share/prompt $HOME/.local/share/prompt

mkdir -p $HOME/.local/bin
ln -sf $1/.local/bin/password-prompt.sh $HOME/.local/bin/password-prompt.sh

################################################################################
# Other important files
################################################################################
ln -sf $1/.gitconfig $HOME/.gitconfig

################################################################################
# All done ;)
################################################################################
mkdir -p $HOME/.config
touch $HOME/.config/init_done
