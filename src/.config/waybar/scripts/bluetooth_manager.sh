#!/bin/bash

VERB="$1"
ADAPTER="$2"

case "$VERB" in
  "lclick")
    POWERED_STATE="$(bluetoothctl show "$2" | grep 'Powered' | sed 's/\s//g' | cut -d ':' -f 2)"
    if [ "$POWERED_STATE" = "yes" ]; then bluetoothctl power off
    else bluetoothctl power on
    fi ;;
  "rclick")
    # TODO: find a way to list all found devices
    ;;
  *)
    echo "urecognized verb $1" >&2
esac

