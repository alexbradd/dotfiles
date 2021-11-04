#! /bin/sh

# This script is meant as to bootsrap a new toolbox environment with all the
# development packages I normally use.
#
# Should be run as root

if [ "$(id -u)" -ne 0 ]; then
    echo "You need root for this!"
    exit 1
fi

if ! [ -f /run/.containerenv ]; then
    echo "You should not run this outside of a container!"
    exit 1
fi

dnf update --refresh -y # make sure we are up to date
dnf copr enable atim/lazygit -y # for lazygit

dnf install git lazygit neovim fzf ripgrep\
    gcc g++ clang clang-tools-extra \
    nodejs npm yarnpkg \
    python python-pip \
    pandoc texlive-scheme-medium \
    -y

# pynvim and nodejs/neovim should be already setup in the home directory
npm install -g prettier eslint
pip install yapf
