#!/bin/bash -x
USER_THEME_URL=https://extensions.gnome.org/extension-data/user-theme%40gnome-shell-extensions.gcampax.github.com.v29.shell-extension.zip
USER_THEME_LOC=$HOME/downloads/user-theme@gnome-shell-extensions.gcampax.github.com.v29.shell-extension.zip
EXTENSIONS_DIR=/usr/share/gnome-shell/extensions
USER_THEME_SCHEMA_LOC=$EXTENSIONS_DIR/user-theme/schemas/org.gnome.shell.extensions.user-theme.gschema.xml
SCHEMA_DEST=/usr/share/glib-2.0/schemas

wget $USER_THEME_URL -P $HOME/downloads
mkdir -p $EXTENSIONS_DIR/user-theme
unzip $USER_THEME_LOC -d $EXTENSIONS_DIR/user-theme
cp $USER_THEME_SCHEMA_LOC $SCHEMA_DEST
glib-compile-schemas $SCHEMA_DEST
