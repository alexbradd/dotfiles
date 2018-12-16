# dotfiles
## Descritpion
This is a repo where I store all of my most configuration files (bashrc, vimrc etc...)
This configuration files have been written slowly as I have been learning programming to suit my needs, so be carful if you want to eventually use them.
## Versioning
Every file has a version formatted as such: *mm.yyyy.x*. The version indicates the last time the file was updated. In this repo you will find all the latest versions.
## Main requisites:
- Arch Linux or pacman
- vim with these plugins:
	- lightline.vim
	- goyo.vim 
	- nerdtree
	- vim-surround
	- ale (requires vim 8 or newer)
- git
## Features
- .bashrc:
	- pretty and colorful
	- git integration: if inside a git repo it displays useful info about the repository like:
		- remote url
		- current branch
		- uncommitted changes
		- unpushed changes
		- stash changes
	- handy aliases for pacman and other stuff (updating the .bashrc, clearing the console etc...)
- .bash_profile:
	- add to path the user private bin folder (~/bin and ~/.local/bin)
- .vimrc:
	- simple vimrc with the most used options enabled and some useful bindings
