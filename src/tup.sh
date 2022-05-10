#! /bin/bash

ORIGIN=
DESTINATION=
TMP=$HOME/.cache/$BASHPID

case $1 in
  -h|--help)
    echo "tup [-h|--help] ORIGIN DESTINATION"
    echo "Transfer all packages from the ORIGIN toolbox to the DESTINATION one."
    echo "All packages that canno be installed in the destination are simply skipped."
    exit 0;;
  *)
    ORIGIN=$1
    DESTINATION=$2;;
esac

toolbox run -c "$ORIGIN" -- bash -c \
  "dnf list installed | awk '{print \$1}' > $TMP" || {
  echo "Error in fetching packages from origin"
  exit 1
}

toolbox run -c "$DESTINATION" -- bash -c \
  "xargs sudo dnf install --assumeyes --skip-broken < $TMP" || {
  echo "Error in installing packaged in destination"
  exit 1
}
