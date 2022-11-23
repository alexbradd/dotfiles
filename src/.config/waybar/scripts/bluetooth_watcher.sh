#!/bin/bash

set -e

ADAPTER="$1"
CONNECTED_ICON=""
POWERED_ICON=""
OFF_ICON=""

snore() {
	local IFS
	[[ -n "${_snore_fd:-}" ]] || exec {_snore_fd}<> <(:)
	read -r ${1:+-t "$1"} -u $_snore_fd || :
}

while snore 0.2; do
  POWERED_STATE="$(bluetoothctl show "$1" | grep 'Powered' | sed 's/\s//g' | cut -d ':' -f 2)"

  if [ "$POWERED_STATE" = "yes" ]; then
    DEVICES_CONNECTED="$(bluetoothctl devices Connected)"
    if [ -n "$DEVICES_CONNECTED" ]; then
      printf '{"text":"%s", "tooltip": "Bluetooth connected", "class": "connected"}\n' "$CONNECTED_ICON"
    else
      printf '{"text":"%s", "tooltip": "Bluetooth on", "class": "activated"}\n' "$POWERED_ICON"
    fi
  else
    printf '{"text":"%s", "tooltip": "Bluetooth off", "class": ""}\n' "$POWERED_ICON"
  fi
done
exit 0
