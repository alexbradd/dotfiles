#!/bin/bash

if [ -z "$(pgrep -x gammastep)" ]; then
  gammastep &
else
  killall gammastep
fi
