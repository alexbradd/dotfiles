#!/bin/bash

KITTY_CMD='kitty +kitten themes --config-file-name=theme.conf --reload-in=all'
THEME_DARK="Catppuccin-Frappe"
THEME_LIGHT="Catppuccin-Latte"

case "$1" in
  "dark")
    $KITTY_CMD $THEME_DARK ;;
  "light" | "default")
    $KITTY_CMD $THEME_LIGHT ;;
  *)
    echo "Unexpected $1"
    exit 1 ;;
esac
