#!/bin/bash

# Download and install google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P ~/downloads
dpkg -i google-chrome*.deb
apt-get install -f
