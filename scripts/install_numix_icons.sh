#!/bin/bash -x
NUMIX_URL=https://github.com/numixproject/numix-icon-theme-circle
NUMIX_LOC=$HOME/downloads/numix-icon-theme-circle
ICON_DEST=/usr/share/icons

git clone $NUMIX_URL $NUMIX_LOC
cp -r $NUMIX_LOC/Numix-Circle* $ICON_DEST
