#!/bin/bash
# https://github.com/jaagr/polybar/wiki
killall -q polybar
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done
polybar default
