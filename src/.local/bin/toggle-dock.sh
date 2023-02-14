#!/bin/sh

set -u

if [ "$1" = 'on' ]; then
  swaymsg 'bindswitch --no-warn --locked lid:on  output eDP-1 disable'
  swaymsg 'bindswitch --no-warn --locked lid:off output eDP-1 enable'
  notify-send 'System' 'Docking mode enabled'
else
  swaymsg 'bindswitch --no-warn --locked lid:on exec systemctl suspend'
  swaymsg 'unbindswitch --locked lid:off'
  notify-send 'System' 'Docking mode disabled'
fi

