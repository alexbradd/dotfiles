#!/bin/bash
# Author: Breadyx

MYNAME="dot.sh"
MYVER="22.12.0"

GIT_ROOT="$HOME/projects/dotfiles/src/"
CONF_ROOT="$HOME/.config/"
CONF_FILE="$HOME/.config/dot-sh.conf"
BACKUPS_CMD=
DRY_RUN=
CLEAN=1
SIGN=-S
MSG="Automated dotifles update of $(date '+%D %H:%M')"

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

Back up folder contents into a git versioned directory and push it. The destination
directory is first wiped and the the files are then copied fresh. Requires that
the git directory is already setup with a valid remote.

Config file contains a space separated list of directories/files to backup

Options:
  -h  --help                     Show this message
  -c  --config                   Use this file for reading what directories to back up
                                 Default: '$CONF_FILE'
  -C  --config-root <conf_root>  Set directory in which configs are stored
                                 Default: '$CONF_ROOT'
  -g  --gitdir <git_root>        Path to the repository where the files will be saved
                                 Default: '$GIT_ROOT'
  -d  --dry-run                  Only simulate behaviour
  -D  --dirs   <dir>,...         Comma separated list of directories to back up.
                                 They are relative to <conf_root>
  -S  --nosign                   Do not sign the created commit
  -x  --no-clean                 Do not clean destination befor copying new files
  -m  --message                  The commit message to use.
                                 Default: '$MSG'
EOF
      exit 0 ;;
    -v|--version)
      echo "$MYNAME $MYVER"
      exit 0 ;;
    -c|--config)
      CONF_FILE=$1 ;;
    -C|--config-root)
      shift
      CONF_ROOT=$1 ;;
    -g|--gitdir)
      shift
      GIT_ROOT=$1 ;;
    -d|--dry-run)
      DRY_RUN=1 ;;
    -D|--dirs)
      shift
      BACKUPS_CMD=($(echo "$1" | tr ',' ' ')) ;;
    -x|--no-clean)
      CLEAN= ;;
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

if [ -z "$BACKUPS_CMD" ]; then read -a BACKUPS < $CONF_FILE
else BACKUPS="${BACKUPS[@]}"
fi

if [ -n "$CLEAN" ]; then
  rm -r $(find "$GIT_DIR.config" -maxdepth 1 ! -wholename "$GIT_DIR.config")
fi

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
