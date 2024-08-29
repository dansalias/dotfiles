#!/bin/bash
ffmpeg \
  -framerate 25 \
  -f x11grab \
  -video_size 2722x1599 -i +19,223 \
  -f pulse \
  -i default \
  -c:v libx264 \
  -preset ultrafast \
  -c:a aac \
  $1

# -f alsa \
# -i default \
# -c:a aac \
#
# -f pulse
# $(slop -f "-video_size %wx%h -i +%x,%y") \
