#!/bin/bash

CURRENT_MODE="$(swaymsg -rt get_outputs | jq '.[] | select(.name == "eDP-1") | .current_mode')"
if [ "$CURRENT_MODE" = "null" ]; then
  printf '{"text": "-", "tooltip": "eDP-1 is unavailable"}\n'
else
  CURRENT_HERZ="$(echo "$CURRENT_MODE" | jq '.refresh/1000' | tr '.' ',')"
  printf '{"text": "%.0fHz", "tooltip": "Current refresh rate"}\n' "$CURRENT_HERZ"
fi
