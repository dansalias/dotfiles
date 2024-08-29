#!/bin/bash
INTERNAL=eDP1
EXTERNAL=DP1

if xrandr | grep "$EXTERNAL disconnected"; then
  xrandr --output "$EXTERNAL" --off --output "$INTERNAL" --auto
else
  xrandr --output "$INTERNAL" --off --output "$EXTERNAL" --auto --scale 2x2 --panning 6880x2880 && \
  feh --bg-fill ~/projects/dotfiles/ui/backgrounds/london.jpg
  ~/.config/polybar/launch.sh
fi
