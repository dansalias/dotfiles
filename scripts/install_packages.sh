#!/bin/bash

# install native packages
pacman -S --needed - apps.native.list

# install package-query
mkdir ~/.aur
git clone https://aur.archlinux.org/package-query.git ~/.aur/package-query
cd ~/.aur/package-query && makepkg -si

# install yaourt
git clone https://aur.archlinux.org/yaourt.git ~/.aur/yaourt
cd ~/.aur/yaourt && makepkg -si

# install AUR packages
yaourt -S $(cat apps.local.list)
