#!/bin/bash

VERB="$1"

case "$VERB" in
  "lclick")
    POWERED_STATE="$(nmcli radio wifi)"
    if [ "$POWERED_STATE" = "enabled" ]; then nmcli radio wifi off
    else nmcli radio wifi on
    fi ;;
  *)
    echo "urecognized verb $1" >&2
esac

