#!/bin/bash

set -e

ADAPTER="$1"
CONNECTED_ICON=""
POWERED_ICON=""
OFF_ICON=""

POWERED_STATE="$(bluetoothctl show "$1" | grep 'Powered' | sed 's/\s//g' | cut -d ':' -f 2)"

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
