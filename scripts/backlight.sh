#!/usr/bin/env bash
#
# get or set the brightness of the focused output
#
# usage:
#   backlight.sh get OUTPUT
#   backlight.sh set {-|+} NUM
#
# examples:
#   backlight.sh get eDP-1
#   backlight.sh set + 10
#   backlight.sh set - 100

get() {
  if [[ $WAYBAR_OUTPUT_NAME =~ ^e.* ]]; then
    echo "$(brightnessctl -m | awk -F, '{print $4}')"
  else
    echo "$(ddcutil --brief getvcp 10 | awk '{print $4}')%"
  fi
}

set() {
  if [[ $(niri msg -j focused-output | jq -r .name) =~ ^e.* ]]; then
    brightnessctl set --min-value=150 "${2}%${1}"
  else
    ddcutil setvcp 10 "${1}" "${2}"
  fi

  pkill --signal SIGRTMIN+1 waybar
}

action=$1

shift

"$action" "$@"
