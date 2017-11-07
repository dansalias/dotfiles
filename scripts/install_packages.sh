#!/bin/bash -x
PACKAGE_LIST_LOC=$HOME/projects/dotfiles/os/packages.list

apt-get install dselect
dselect update
dpkg --set-selections < $PACKAGE_LIST_LOC
apt-get dselect-upgrade
