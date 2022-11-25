#!/bin/bash

set -e

CURRENT_HERZ="$(swaymsg -rt get_outputs | jq '.[] | select(.name == "eDP-1") | .current_mode.refresh/1000' | tr '.' ',')"
printf '{"text": "%.0fHz", "tooltip": "Current refresh rate"}\n' "$CURRENT_HERZ"
