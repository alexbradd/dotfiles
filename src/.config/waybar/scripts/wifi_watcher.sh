#!/bin/bash

set -e

POWERED_ICON=""
OFF_ICON=""

POWERED_STATE="$(nmcli radio wifi)"
if [ "$POWERED_STATE" = "enabled" ]; then
  printf '{"text":"%s", "tooltip": "Wifi on", "class": "activated"}\n' "$POWERED_ICON"
else
  printf '{"text":"%s", "tooltip": "Wifi off", "class": ""}\n' "$OFF_ICON"
fi
