#
# ~/.bashrc
# Version: 12.2018.3

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### SETTINGS ###
tabs 5

### ALIASES ###
# Misc
alias ls="ls -a --color=auto"
alias cls="clear"
alias edit-vimrc="vim ~/.vimrc"
alias darkscrn="xset dpms force off"

# Pacman aliases
alias install="sudo pacman -S"
alias update="sudo pacman -Syu"
alias remove="sudo pacman -R"
function autoremove { sudo pacman -R "$(pacman -Qdtq)"; }

### PROMPT PERSONALIZATION ###
# Special characters
# \h hostname up to the first .
# \A current time in HH:MM
# \u username
# \w cwd
# \$ command separator

# Functions
function _git_prompt {
	if ! { find . -maxdepth 0 ".git" | grep -qv '^'; }; then
		REPO="$(git config --get remote.origin.url | cut -d "/" --fields="$(seq --separator=" " 3 100)")"
		BRANCH="$(git branch | grep "\*" | cut -d " " -f2)"
		#COMMITS=$(git rev-list --left-right --count origin/$BRANCH...$BRANCH) # AHEAD   BEHIND to origin
		#AHEAD_BEHIND="$(echo $COMMITS | cut -d " " -f2) ahead, $(echo $COMMITS | cut -d " " -f1) behind origin/$BRANCH"
		if [ -n "$(git stash list)" ]; then STASHED="$"; fi
		if [ -n "$(git log origin/"$BRANCH"..HEAD)" ]; then UNPUSHED="+"; fi
		if [ -n "$(git status -u -s)" ]; then UNTRACKED="*"; fi
		echo -e "\n\t${ORANGE}$REPO; $BRANCH; [$UNTRACKED$UNPUSHED$STASHED]"
	fi
}
function _uprc {
	REPO="https://raw.githubusercontent.com/BreadyX/dotfiles/master/.bashrc"
	INPUT=""
	read -ar CUR_VER < <(sed '3q;d' ~/.bashrc | cut -d " " -f3 | sed 's/\./ /g')
	NEW_VER=
	echo "Would you like to check if a new version of the .bashrc file is available in the git repo? [Y/N]"
	read -r INPUT
	if [ "$INPUT" == "Y" ] || [ "$INPUT" == "y" ]; then
		echo "Checking for updates..."
		### Download the latest .bashrc from gitub
		wget -V &> /dev/null || echo "wget is not installed. Cannot download latest version. Please install wget with 'sudo pacman -S wget' or 'install wget'"
		( cd /tmp || return 1
	       	wget -O .bashrc $REPO &> /dev/null
		read -ar NEW_VER < <(sed '3q;d' .bashrc | cut -d " " -f3 | sed 's/\./ /g')
		### Check version
		if [ "${NEW_VER[0]}" -ge "${CUR_VER[0]}" ] || [ "${NEW_VER[1]}" -ge "${CUR_VER[1]}" ] || [ "${NEW_VER[2]}" -ge "${CUR_VER[2]}" ]; then
			echo "New version ${NEW_VER[0]}.${NEW_VER[1]}.${NEW_VER[2]} found. Updating..."; cp .bashrc ~
		fi
		### Cleanup
		rm .bashrc; )
	fi
	echo "Sourcing file..."
	source ~/.bashrc
}

function rc {
	case $1 in
		"--help"|"-h")
			cat << EOF
function rc - function declared inside Breadyx's ~/.bashrc that provides some shortcuts to managing the .bashrc.
	--help 		-h	Print this dialog.
	--version	-v	Print version of file
	--update 	-u	Update the bashrc with the latest available in the github repo.
	--re-source	-r	Resource the .bashrc without downloading it
	--edit		-e	Edit the .bashrc with vim
EOF
			;;
		"--version"|"-v")
			echo "BreadyX's .bashrc - version $(sed '3q;d' ~/.bashrc | cut -d " " -f3)"
			;;
		"--update"|"-u")
			_uprc
			;;
		"--re-source"|"-r")
			echo "Resourcing..."
			source ~/.bashrc
			;;
		"--edit"|"-e")
			vim ~/.bashrc
			;;
		*)
			echo "Invalid usage, please see 'rc --help' or 'rc -h' for informations" > /dev/stderr
			;;
	esac
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
GPG_TTY=$(tty); export GPG_TTY
