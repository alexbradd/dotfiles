# BreadyX's dotfiles
## Descritpion
This is a repo where I store all of my most important configuration files (`.bashrc`, `.vimrc` etc...)
These configuration files have been written slowly as I have been learning programming to suit my needs, so be carful if you want to eventually use them as they can sometimes be buggy.
## Versioning
All the files that are written by me (bash config and neovim config) have the following header:
```
#
# File: file
# Version: mm.yyyy.x
# Author: BreadyX
#
# description
#
```
where `#` is the comment simbol in the language that the file is written in.
Eache file has a version formatted, as written previously, as mm.yyyy.x. In this repo you will find all the latest and greatest config files and their most recent versions. Some of the files have an *updater* that can be called that automates the process of fecthing the latest version from this repo and applying it.
# Installation
Firstly: **BE CAREFUL WHEN INSTALLING** because you can have a much different setup than mine and have conflicts everywhere.
To install, simply clone this repository in a separate folder and then copy its contents into you home directory:
```sh
cd ~
git clone https://github.com/BreadyX/dotfiles.git
cd dotfiles
cp -r * ~
cd ~
rm -rf dotfiles
```
It is advised that you do this procedure in a tty outside of your DE by simply logging out (not locking *logging out*) and pressing `CTRL+ALT+F2` in your DM (the login screen). After the installation, go back to you graphical environment by pressing `CTRL+ALT+F1` (in some cases `CTRL+ALT+F7`) and log into your account.
### Main requisites:
- Arch Linux with pacman
- KDE Plasma 5 with konsole and dolphin
	- Fonts DejaVu Sans and Inconsolata are required, installable on Arch linux with:
		```
		# pacman -S ttf-dejavu ttf-inconsolata
		```
- Latte Dock
- NeoVim with these plugins:
	- Vim-plug
	- goyo
	- Limelight
	- Darcula coloscheme
	- vim-surround
	- vim-latex-live-preview
	- Neomake
	- Deoplete
- git
## Features
- Plasma 5 and Latte Dock:
	- Clean look with a minimal theme:
		- Blur, traslucency and more eye candy is enabled to make everyithing look even better
	- 2 activities: *Normal usage* and *Coding*
	- *Windows-esque* global shortucts for navigating between desktops, windows ecc...
	- 3 main panels with all the necessary info:
		- TOP: *gnome-styled* panel with dynamic background, global menus and other widgets such as: clock, systemload, system tray and log out button
		- LEFT: ubuntu/unity styled dock that autohides
		- BOTTOM: panel that contains an activity/vitual desktop switcher
- bash:
	- pretty and colorful
	- git integration: if inside a git repo it displays useful info about the repository like:
		- remote url
		- current branch
		- uncommitted changes
		- unpushed changes
		- stash changes
	- handy aliases for pacman and other stuff
	- add to path the user private bin folder (~/bin and ~/.local/bin)
- vim:
	- included some plugins that make life easier
	- created some templates for common filetypes (tex ecc...)
	- created some snippets for some langauges
	- simple vimrc with the most used options enabled and some useful bindings
