#!/bin/bash

CONNECTED_ICON=""
POWERED_ICON=""
OFF_ICON=""

CTRL_STATE="$(bluetoothctl show "$1")"
[ "$?" -eq 1 ] && {
  printf '{"text": "-", "tooltip": "Bluetooth unavailable"}\n'
  exit 0
}

POWERED_STATE="$(echo "$CTRL_STATE" | grep 'Powered' | sed 's/\s//g' | cut -d ':' -f 2)"

if [ "$POWERED_STATE" = "yes" ]; then
  DEVICES_CONNECTED="$(bluetoothctl devices Connected)"
  if [ -n "$DEVICES_CONNECTED" ]; then
    printf '{"text":"%s", "tooltip": "Bluetooth connected", "class": "connected"}\n' "$CONNECTED_ICON"
  else
    printf '{"text":"%s", "tooltip": "Bluetooth on", "class": "activated"}\n' "$POWERED_ICON"
  fi
else
  printf '{"text":"%s", "tooltip": "Bluetooth off", "class": ""}\n' "$POWERED_ICON"
fi
