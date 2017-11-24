#!/bin/bash

DF=~/projects/dotfiles

# Create directories
mkdir -p ~/.config/{i3,polybar}

# x config
ln -sf $DF/x/.xinitrc ~/.xinitrc
ln -sf $DF/x/.Xresources ~/.Xresources

# window manager config
ln -sf $DF/i3/config ~/.config/i3/config
ln -sf $DF/compton/compton.conf ~/.config/compton.conf
ln -sf $DF/polybar/config ~/.config/polybar/config
ln -sf $DF/polybar/launch.sh ~/.config/polybar/launch.sh
ln -sf $DF/rofi/config ~/.config/rofi/config

# other
ln -sf $DF/zsh/.zshrc ~/.zshrc
ln -sf $DF/vim/.vimrc ~/.vimrc
ln -sf $DF/vim/city-lights.vim ~/.vim/colors/city-lights.vim
ln -sf $DF/git/.gitconfig ~/.gitconfig
