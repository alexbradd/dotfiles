#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### ALIASES ###
# Misc
alias ls="ls --color=auto"
alias cls="clear"
alias uprc="source ~/.bashrc"

# Pacman aliases
alias update="pacman -Syu"
alias remove="pacman -R"
alias autoremove="pacman -R $(pacman -Qdtq)"

# Git aliases
alias commit="git commit -S -a"
alias push="git push"

### PROMPT PERSONALIZATION ###
# Special characters
# \h hostname up to the first .
# \A current time in HH:MM
# \u username
# \w cwd
# \$ command separator

# Functions
function git_prompt {
        if [ -n "$(ls -a $(pwd)| grep -wo ".git")" ]; then
                BRANCH="$(git branch | grep \* | cut -d " " -f2)"
                REMOTE="$(git config --get remote.origin.url)"
                REPO=
                if [ "$(echo $REMOTE | cut -d "/" -f3)" == "github.com" ]; then
                        REPO="$(echo $REMOTE | cut -d "/" -f5 | cut -d "." -f1)"
                else
                        REPO="...$(echo $REMOTE | cut -d "/" --fields="$(seq --separator=" " 3 100)")"
                fi
                echo "$ORANGE{ git: $REPO at branch: $BRANCH } "
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

PS1="\n\[$WHITE\](\A) - " # Current time
PS1+="\[$RED\]\u " # User
PS1+="\[$WHITE\]at "
PS1+="\[$BLUE\]\[$ITALICS\]\h \[$RESET\]" # Host
PS1+="\[$WHITE\]in "
PS1+="\[$GREEN\]\[$ITALICS\]\w \[$RESET\]" # Working directory
PS1+="\[$ITALICS\]\[\$(git_prompt)\]\[$RESET\]"
PS1+="\n\$ " 

export PS1;
