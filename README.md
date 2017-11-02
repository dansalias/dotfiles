# dotfiles
My dotfiles and scripts for bootstrapping a clean Debian installation.

## NOTE!
Do not blindly use the bootstrap script to configure an existing installation, this will have serious consequences (such as *wiping your home directory*).
The bootstrap script is designed to setup a fresh minimal Debian installation (no GUI) with Gnome, the Arc Theme, Numix Icons, and a small number of packages that I use for web development.
Feel free to fork the repo and/or use it as inspiration for your own dotfiles.

## Debian Installation
Install Debian using the Expert Installer (Advanced Options -> Expert Install).
Load only the choose-mirror installer component.
Create a root account.
Install targeted driver's only.
Allow non-free software.
Enable source repositories in APT.
Enable security updates, release updates, and backported software.
Don't install a desktop environment (the bootstrap script handles this); only select the "standard system utilities".

## Install git and sudo
As root:
```bash
apt-get update && apt-get install sudo git
adduser <your-username> sudo
exit
```

## Clone repo and run bootstrap script
As user:
```bash
git clone https://github.com/d4n13ly/dotfiles ~/projects/dotfiles
sudo -E ~/projects/dotfiles/bootstrap.sh
```
