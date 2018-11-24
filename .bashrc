#
# ~/.bashrc
# Version: 24-11-18.0

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### SETTINGS ###
tabs 5

### ALIASES ###
# Misc
alias ls="ls -a --color=auto"
alias cls="clear"
alias uprc="source ~/.bashrc"
alias editrc="vim ~/.bashrc"
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
function func {
	echo "func"
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
