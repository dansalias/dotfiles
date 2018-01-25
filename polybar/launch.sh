#!/bin/bash
# https://github.com/jaagr/polybar/wiki
killall -q polybar
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar default
  done
else
  polybar default
fi

# polybar default
