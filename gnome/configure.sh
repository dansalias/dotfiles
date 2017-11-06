#!/bin/bash -x
NUMIX_URL=https://github.com/numixproject/numix-icon-theme-circle
NUMIX_LOC=$HOME/downloads/numix-icon-theme-circle
ICON_DEST=/usr/share/icons
USER_THEME_URL=https://extensions.gnome.org/extension-data/user-theme%40gnome-shell-extensions.gcampax.github.com.v29.shell-extension.zip
USER_THEME_LOC=$HOME/downloads/user-theme@gnome-shell-extensions.gcampax.github.com.v29.shell-extension.zip
EXTENSIONS_DIR=$HOME/.local/share/gnome-shell/extensions
USER_THEME_SCHEMA_LOC=$EXTENSIONS_DIR/user-theme@gnome-shell-extensions.gcampax.github.com/schemas/org.gnome.shell.extensions.user-theme.gschema.xml
SCHEMA_DEST=/usr/share/glib-2.0/schemas

git clone $NUMIX_URL $NUMIX_LOC
cp -r $NUMIX_LOC/Numix-Circle* $ICON_DEST

wget $USER_THEME_URL -P $HOME/downloads
unzip $USER_THEME_LOC -d $EXTENSIONS_DIR/user-theme
cp $USER_THEME_SCHEMA_LOC $SCHEMA_DEST
glib-compile-schemas $SCHEMA_DEST

gsettings set org.gnome.shell enabled-extensions "['user-theme@gnome-shell-extensions.gcampax.github.com']"
gsettings set org.gnome.desktop.interface gtk-theme "Arc-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Numix-Circle"
gsettings set org.gnome.shell.extensions.user-theme name "Arc-Dark"
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'google-chrome.desktop', 'gnome-music.desktop', 'org.gnome.Terminal.desktop']"
