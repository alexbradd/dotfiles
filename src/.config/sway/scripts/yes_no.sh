#!/bin/bash

CHOICE=$(echo -e "Yes\nNo" | wofi -S dmenu -p "$1" -c ~/.config/wofi/yes_no)
case $CHOICE in
  Yes) $2 ;;
  *) ;;
esac
