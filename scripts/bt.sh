#!/bin/bash

case "$1" in
  status)
    systemctl is-active bluetooth.service
    ;;
  on)
    systemctl enable bluetooth.service
    ;;
  off)
    systemctl stop bluetooth.service
    ;;
esac
