#!/bin/bash

set -e

SHUTDOWN="Shutdown"
REBOOT="Reboot"
SUSPEND="Suspend"
HIBERNATE="Hibernate"
LOGOUT="Log out"

CHOICE=$(echo -e "$SHUTDOWN\n$REBOOT\n$SUSPEND\n$HIBERNATE\n$LOGOUT" | wofi -S dmenu -p "Log out" --lines 7)
case "$CHOICE" in
  $SHUTDOWN) systemctl poweroff ;;
  $REBOOT) systemctl reboot ;;
  $SUSPEND) systemctl suspend ;;
  $HIBERNATE) systemctl hibernate ;;
  $LOGOUT) swaymsg exit ;;
  *) ;;
esac
