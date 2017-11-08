#!/bin/bash -x
DF=$HOME/projects/dotfiles
SCRIPTS=$DF/scripts

# Create home directory structure
shopt -s extglob
rm -r $HOME/!(projects)
mkdir -p $HOME/{downloads,desktop,media/{images,music,videos,documents}}

# Install Google Chrome
source $SCRIPTS/install_chrome.sh

# Install user-theme extension
source $SCRIPTS/install_user_theme_extension.sh

# Install Numix icons
source $SCRIPTS/install_numix_icons.sh

# Configure Gnome
source $SCRIPTS/configure_gnome.sh

# Create symlinks
source $SCRIPTS/create_symlinks.sh

# Install vim plugin manager
source $SCRIPTS/install_vim_plug.sh
