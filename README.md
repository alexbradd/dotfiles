# BreadyX's dotfiles
## Descritpion
This is where I store most of my configuration files. These files have been written
to suit *my* needs and to work in *my* setup, so be careful if you want to eventually 
use them as they maybe won't play nice with yours.

## Versioning
All the files that are written by me have the following header:
```
#
# File: file
# Version: mm.yyyy.x
# Author: BreadyX
#
# description
#
```
where `#` is the comment symbol in the language that the file is written in.
Each file has a version formatted, as written previously, as mm.yyyy.x. In this 
repository you will find the latest configuration files. 

# Installation
Firstly: **BE CAREFUL WHEN INSTALLING** because, since there could be differences
in our configurations, there could be problems such as missing packages.

To install, simply clone this repository in a separate folder and then copy its 
contents into you home directory:
```sh
cd ~
git clone https://github.com/BreadyX/dotfiles.git
cd dotfiles
cp -r * ~
cd ~
rm -rf dotfiles
```

### Main requisites:
- Fedora
- bash
- Font-awesome (needed for some glyphs in the prompt)  
    It can be installed on Fedora with `sudo dnf install fontawesome-fonts` 
- Inconsolata (font used in the terminal)  
    It can be installed on Fedora with `sudo dnf install evien-inconsolata-fonts` 
- NeoVim with vim-plug  
    The packages can be installed after the dotfile installation by running `:PlugInstall` in NeoVim)
- Git (needed for cloning the repository and for the git prompt in the bash prompt)
- Termite (default terminal emulator)
