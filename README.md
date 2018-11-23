# dotfiles
## Descritpion
This is a repo where I store all of my most configuration files (bashrc, vimrc etc...)
This configuration files have been written slowly as I have been learning programming to suit my needs, so be carful if you want to eventually use them.
## Versioning
Every file has a version formatted as such: *dd-mm-yy.X*. The version indicates the last time the file was updated. In this repo you will find all the latest versions.
## Main requisites:
- Arch Linux/pacman
- vim
- some vim plugins:
  	- none for now
- git
## Features
- bashrc:
	- pretty and colorful
	- git integration: if inside a git repo it displays useful info about the repository like:
		- remote url (if remote is github.com only the repo name)
		- current branch
		- uncommitted changes
		- unpushed changes
		- stash changes
	- handy aliases for git, pacman and other tasks (resource the bashrc, edit the bashrc etc...)
- bash_profile:
	- add to path the user private bin folder (~/bin and ~/.local/bin)
- vimrc:
	- very simple vimrc with the most used options enabled and some useful bindings
