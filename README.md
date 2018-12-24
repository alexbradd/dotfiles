# BreadyX's dotfiles
## Descritpion
This is a repo where I store all of my most important configuration files (`.bashrc`, `.vimrc` etc...)
These configuration files have been written slowly as I have been learning programming to suit my needs, so be carful if you want to eventually use them as they can sometimes be buggy.
## Versioning
The most important files (such as bashrc ecc...) have a version formatted as such: *mm.yyyy.x*. The version indicates the last time the file was updated. In this repo you will find all the latest versions.
## Installation
Firstly: **BE CAREFUL WHEN INSTALLING** because you can have a much different setup than mine and have conflicts everywhere.
To install, simply clone this repository in a separate folder and the copy its contents into you home directory:
```sh
cd ~
git clone https://github.com/BreadyX/dotfiles.git
cd dotfiles
cp * ~
cd ~
rm -rf dotfiles
```
It is advised that you do this procedure in a tty outside of your DE by simply logging out (not locking *logging out*) and pressing `CTRL+ALT+F2` in your DM (the login screen). After the installation, go back to you graphical environment by pressing `CTRL+ALT+F1` (in some cases `CTRL+ALT+F7`) and log into your account.
### Main requisites:
- Arch Linux or pacman
- vim with these plugins:
	- lightline.vim
	- goyo.vim
	- nerdtree
	- vim-surround
	- ale (requires vim 8 or newer)
	- vim-latex-live-preview
- git
- KDE Plasma 5
- Latte Dock
## Features
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
- Plasma 5 and Latte Dock:
	- Clean look with a minimal theme:
		- Blur, traslucency and more eye candy is enabled to make everyithing look even better
	- 2 activities: *Normal usage* and *Coding*
	- *Windows-esque* global shortucts for navigating between desktops, windows ecc...
	- 3 main panels with all the necessary info:
		- TOP: *gnome-styled* panel with dynamic background, global menus and other widgets such as: clock, systemload, system tray and log out button
		- LEFT: ubuntu/unity styled dock that autohides
		- BOTTOM: panel that contains an activity/vitual desktop switcher
