#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### SETTINGS ###
tabs 5

### ALIASES ###
# Misc
alias ls="ls --color=auto"
alias cls="clear"
alias uprc="source ~/.bashrc"
alias editrc="vim ~/.bashrc"
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
alias add-all="git add ."
alias status="git status"

### PROMPT PERSONALIZATION ###
# Special characters
# \h hostname up to the first .
# \A current time in HH:MM
# \u username
# \w cwd
# \$ command separator

# Functions
function _git_repo {
        BRANCH="$(git branch | grep \* | cut -d " " -f2)"
        REMOTE="$(git config --get remote.origin.url)"
        REPO=
        if [ "$(echo $REMOTE | cut -d "/" -f3)" == "github.com" ]; then
                REPO="$(echo $REMOTE | cut -d "/" -f5 | cut -d "." -f1)"
        else
                REPO="...$(echo $REMOTE | cut -d "/" --fields="$(seq --separator=" " 3 100)")"
        fi
        echo "$REPO; branch $BRANCH"
}
function _git_commit_ahead {
        BRANCH=$(git branch | grep \* | cut -d ' ' -f2)
        COMMITS=$(git rev-list --left-right --count origin/$BRANCH...$BRANCH) # AHEAD   BEHIND to origin
        BEHIND=$(echo $COMMITS | cut -d " " -f1)
        AHEAD=$(echo $COMMITS | cut -d " " -f2)
        echo "$AHEAD ahead, $BEHIND behind origin/$BRANCH"
}
function git_prompt {
        if [ -n "$(ls -a | grep -wo ".git")" ]; then
                echo -e "\n${TAB}${ORANGE}GIT: $(_git_repo); $(_git_commit_ahead)"
        fi
}

# Colors and stuff
RED=$(tput setaf 196)
ORANGE=$(tput setaf 166)
BLUE=$(tput setaf 33)
GREEN=$(tput setaf 34)
WHITE=$(tput setaf 255)

ITALICS=$(tput sitm)

RESET=$(tput sgr0)

TAB=$(echo -e "\t")

PS1="\n\[$WHITE\](\A) - " # Current time
PS1+="\[$RED\]\u " # User
PS1+="\[$WHITE\]at "
PS1+="\[$BLUE\]\[$ITALICS\]\h \[$RESET\]" # Host
PS1+="\[$WHITE\]in "
PS1+="\[$GREEN\]\[$ITALICS\]\w " # Working directory
PS1+="\$(git_prompt)"
PS1+="\[$RESET\]\n\$ " 

export PS1;

# Make GPG work by setting GPG_TTY global variable
export GPG_TTY=$(tty)
