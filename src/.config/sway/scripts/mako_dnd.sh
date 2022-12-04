#!/bin/bash

[ -z "$(pgrep mako)" ] && { echo "Mako is not running"; exit 1; }
IS_DND_OFF="$(makoctl mode | grep -q 'dnd'; echo "$?")"

case "$1" in
  toggle)
    if [ $IS_DND_OFF -eq 1 ]; then
      makoctl mode -a dnd
    else
      makoctl mode -r dnd
    fi ;;
  check)
    if [ $IS_DND_OFF -eq 1 ]; then
      echo "off"
    else
      echo "on"
    fi ;;
  *)
    echo "Unknown verb"
    exit 1 ;;
esac

