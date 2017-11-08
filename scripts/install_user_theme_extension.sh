#!/bin/bash -x
USER_THEME_URL=https://extensions.gnome.org/extension-data/user-theme%40gnome-shell-extensions.gcampax.github.com.v29.shell-extension.zip
USER_THEME_LOC=$HOME/downloads/user-theme@gnome-shell-extensions.gcampax.github.com.v29.shell-extension.zip
EXTENSION_DIR=$HOME/.local/share/gnome-shell/extensions/user-theme@gnome-shell-extensions.gcampax.github.com
USER_THEME_SCHEMA_LOC=$EXTENSION_DIR/schemas/org.gnome.shell.extensions.user-theme.gschema.xml
SCHEMA_DEST=/usr/share/glib-2.0/schemas

wget $USER_THEME_URL -P $HOME/downloads
mkdir -p $EXTENSION_DIR
unzip $USER_THEME_LOC -d $EXTENSION_DIR
sudo cp $USER_THEME_SCHEMA_LOC $SCHEMA_DEST
sudo glib-compile-schemas $SCHEMA_DEST
