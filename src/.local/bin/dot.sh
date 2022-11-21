#!/bin/bash
# Author: Breadyx
# Version: 22.11.0

MYNAME="dot.sh"
MYVER="22.11.0"

GIT_ROOT="$HOME/projects/dotfiles/src/"
CONF_ROOT="$HOME/.config/"
DRY_RUN=
SIGN=-S
MSG="Automated dotifles update of $(date '+%D %H:%M')"
BACKUPS=("nvim")

OPTS=$(getopt -n "$MYNAME" \
              -o hvc:g:dD:Sm: \
              --long help,version,configdir:,gitdir:,dry-run,dirs:,nosign,message: -- "$@")
[ "$?" -ne 0 ] && {
  echo "Incorrect options"
  exit 1
}

eval set -- "$OPTS"
while true; do
  case "$1" in
    -h|--help)
      cat <<EOF
Usage: $MYNAME [options]...

Back up folder contents into a git versioned directory and push it.
Requires that the git directory is already setup with a valid remote.

Options:
  -h  --help                Show this message
  -c  --config <conf_root>  Set directory in which configs are stored
                            Default: '$CONF_ROOT'
  -g  --gitdir <git_root>   Path to the repository where the files will be saved
                            Default: '$GIT_ROOT'
  -d  --dry-run             Only simulate behaviour
  -D  --dirs   <dir>,...    Comma separated list of directories to back up.
                            They are relative to <conf_root>
  -S  --nosign              Do not sign the created commit
  -m  --message             The commit message to use.
                            Default: '$MSG'
EOF
      exit 0 ;;
    -v|--version)
      echo "$MYNAME $MYVERS"
      exit 0 ;;
    -c|--config)
      shift
      CONF_ROOT=$1 ;;
    -g|--gitdir)
      shift
      GIT_ROOT=$1 ;;
    -d|--dry-run)
      DRY_RUN=1 ;;
    -D|--dirs)
      shift
      BACKUPS=($(echo "$1" | tr ',' ' ')) ;;
    -S|--nosign)
      SIGN= ;;
    -m|--message)
      shift
      MSG="$1" ;;
    --)
      break ;;
    *)
      echo "Incorrect options"
      exit 1
  esac
  shift
done

for c in ${BACKUPS[@]}; do
  if [ -z "$DRY_RUN" ]; then cp -r "$CONF_ROOT$c" "$GIT_ROOT.config/"
  else echo "Copying $CONF_ROOT$c into $GIT_ROOT.config/"
  fi
done

if [ -z "$DRY_RUN" ]; then
    cd "$GIT_ROOT"
    git add -A
    git commit $SIGN -m "$MSG"
    git push
else
  echo "Committing and pushing..."
fi
