#!/bin/bash -x

DF=$HOME/projects/dotfiles

# Install packages
source $DF/os/install_packages.sh

# Create home directory structure
mkdir -p $HOME/{downloads,desktop,media/{images,music,videos,documents}}

# Configure Gnome
source $DF/gnome/configure.sh

# Install Google Chrome
source $DF/chrome/install.sh
