#
# ~/.bashrc
# Version: 24-11-2018-3

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### SETTINGS ###
tabs 5

### ALIASES ###
# Misc
alias ls="ls -a --color=auto"
alias cls="clear"
alias source-rc="source ~/.bashrc"
alias edit-rc="vim ~/.bashrc"
alias edit-vimrc="vim ~/.vimrc"
alias darkscrn="xset dpms force off"

# Pacman aliases
alias install="sudo pacman -S"
alias update="sudo pacman -Syu"
alias remove="sudo pacman -R"
alias autoremove="sudo pacman -R $(pacman -Qdtq)"

# Git aliases
alias commit="git commit -S -a"
alias push="git push"
alias pull="git pull"
alias add="git add"
alias add-all="git add -A"
alias status="git status"
alias stash="git statsh"
alias stashed="git stash list"

### PROMPT PERSONALIZATION ###
# Special characters
# \h hostname up to the first .
# \A current time in HH:MM
# \u username
# \w cwd
# \$ command separator

# Functions
function _git_prompt {
        if [ -n "$(ls -a | grep -wo ".git")" ]; then
		REPO="$(git config --get remote.origin.url | cut -d "/" --fields="$(seq --separator=" " 3 100)")"
		BRANCH="$(git branch | grep \* | cut -d " " -f2)"
		COMMITS=$(git rev-list --left-right --count origin/$BRANCH...$BRANCH) # AHEAD   BEHIND to origin
		AHEAD_BEHIND="$(echo $COMMITS | cut -d " " -f2) ahead, $(echo $COMMITS | cut -d " " -f1) behind origin/$BRANCH"
		if [ -n "$(git stash list)" ]; then STASHED="$"; fi
		if [ -n "$(git log origin/master..HEAD)" ]; then UNPUSHED="+"; fi
		if [ -n "$(git status -u -s)" ]; then UNTRACKED="*"; fi
		echo -e "\n\t${ORANGE}$REPO; $BRANCH; $AHEAD_BEHIND [$UNTRACKED$UNPUSHED$STASHED]"
        fi
}
function uprc {
	REPO="https://github.com/BreadyX/dotfiles.git"
	INPUT=""
	CUR_VER=$(sed '3q;d' ~/.bashrc | cut -d " " -f3 | sed 's/-//g')
	NEW_VER=
	echo "Would you like to check if a new version of the .bashrc file is available in the git repo? [Y/N]"
	read INPUT
	if [ $INPUT == "Y" -o $INPUT == "y" ]; then
		echo "Checking for updates..."
		pushd /tmp > /dev/null; git clone $REPO > /dev/null; cd dotfiles
		NEW_VER=$(sed '3q;d' .bashrc | cut -d " " -f3 | sed 's/-//g')
		if [ $NEW_VER -gt $CUR_VER ]; then echo "Found new version $NEW_VER (old version $CUR_VER)"; cp .bashrc ~; fi
		popd > /dev/null ; rm -rf dotfiles
	fi
	echo "Updating..."
	source ~/.bashrc
}

# Colors and stuff
RED=$(tput setaf 196)
ORANGE=$(tput setaf 166)
BLUE=$(tput setaf 33)
GREEN=$(tput setaf 34)
WHITE=$(tput setaf 255)

ITALICS=$(tput sitm)

RESET=$(tput sgr0)

PS1="\n\[$WHITE\](\A) - " # Current time
PS1+="\[$RED\]\u " # User
PS1+="\[$WHITE\]at "
PS1+="\[$BLUE\]\[$ITALICS\]\h \[$RESET\]" # Host
PS1+="\[$WHITE\]in "
PS1+="\[$GREEN\]\[$ITALICS\]\w " # Working directory
PS1+="\$(_git_prompt)"
PS1+="\[$RESET\]\n\$ " 

export PS1;

# Make GPG work by setting GPG_TTY global variable
export GPG_TTY=$(tty)
