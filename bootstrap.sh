#!/bin/bash

# Tell Debian not to expect any input
export DEBIAN_FRONTEND = noninteractive > /dev/null

# Update package lists
apt-get -qq update

# Install git and clone repository
apt-get install -y --no-install-recommends git
git clone https://github.com/kiwidan92/dotfiles.git ~/projects/dotfiles

# Execute all shell scripts in dotfiles directory
for SCRIPT in ~/projects/dotfiles/**/*
do
		if [ -f $SCRIPT -a -x $SCRIPT]
		then
				$SCRIPT
		fi
done
