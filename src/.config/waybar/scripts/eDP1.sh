#!/bin/bash

set -u

EDP1="$(swaymsg -rt get_outputs | jq '.[] | select(.name == "eDP-1")')"
if [ "$EDP1" = "null" ]; then
  printf '{"text": "NA", "tooltip": "eDP-1 is unavailable"}\n'
  exit
fi

CURRENT_MODE="$(echo "$EDP1" | jq '.current_mode')"
if [ "$CURRENT_MODE" = "null" ]; then
  printf '{"text": "-", "tooltip": "eDP-1 is powered off"}\n'
  exit
fi

CURRENT_HERZ="$(echo "$CURRENT_MODE" | jq '.refresh/1000' | tr '.' ',')"
printf '{"text": "%.0fHz", "tooltip": "Current refresh rate"}\n' "$CURRENT_HERZ"
