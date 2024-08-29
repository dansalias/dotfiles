#!/bin/bash

# create packages directory
mkdir $HOME/packages

# install git
pacman -S git

# install yay
git clone https://aur.archlinux.org/yay.git $HOME/packages/yay
cd $HOME/packages/yay
makepkg -si

# install packages
yay -Syyu \
  # system
  pulseaudio \
  pulseaudio-alsa \
  pulseaudio-bluetooth \
  imagemagick \
  bluez \
  bluez-firmware \
  bluez-utils \
  light \
  zsh \
  pass \
  vim \
  sudo \
  ranger \
  nodejs \
  httpie \
  neofetch \
  github-cli-bin \
  # ui
  xorg \
  i3-gaps-next-git \
  i3lock \
  rxvt-unicode \
  xcwd-git \
  feh \
  scrot \
  unclutter \
  polybar \
  rofi \
  ttf-inconsolata \
  ttf-croscore \
  pavucontrol \
  # web
  google-chrome \
  firefox-developer-edition \
  browserpass-chrome \
  #apps
  slack-desktop \
  vlc \
