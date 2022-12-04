#!/bin/bash

DND_OFF=""
DND_ON=""

DND="$($HOME/.config/sway/scripts/mako_dnd.sh check)"

case $DND in
  on)
    printf '{"text": "%s", "tooltip": "Notifications activated"}' "$DND_ON" ;;
  off)
    printf '{"text": "%s", "tooltip": "Notifications disabled"}' "$DND_OFF" ;;
esac
