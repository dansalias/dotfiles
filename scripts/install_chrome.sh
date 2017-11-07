#!/bin/bash -x
CHROME_PACKAGE_NAME=google-chrome-stable_current_amd64.deb
CHROME_URL=https://dl.google.com/linux/direct/$CHROME_PACKAGE_NAME
CHROME_PREFERENCES_LOC=$HOME/.config/google-chrome/Default/Preferences

# Download and install google chrome
wget $CHROME_URL -P $HOME/downloads
dpkg -i $HOME/downloads/$CHROME_PACKAGE_NAME
apt-get install -f

# Remove custom frame
jq -c '.browser.custom_chrome_frame = false' $CHROME_PREFERENCES_LOC > tmp.$$.json && mv tmp.$$.json $CHROME_PREFERENCES_LOC
