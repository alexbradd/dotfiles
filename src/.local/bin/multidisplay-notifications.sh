#!/bin/sh

set -u

if [ "$1" = 'on' ]; then
  makoctl mode -r multidisplay
  notify-send 'System' 'Notifications visible on all monitors'
else
  makoctl mode -a multidisplay
  notify-send 'System' 'Notifications visible on internal display only'
fi

