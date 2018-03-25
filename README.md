# dotfiles
For Arch Linux & i3

## Debian Installation
- Install Debian using the Expert Installer (Advanced Options -> Expert Install).
- Load only the choose-mirror installer component.
- Create a root account.
- Install targeted drivers only.
- Allow non-free software.
- Enable source repositories in APT.
- Enable security updates, release updates, and backported software.
- Don't install a desktop environment (the bootstrap script handles this); only select the "standard system utilities".

## Install git and sudo
As root:
```bash
apt-get update && apt-get install sudo git
adduser <your-username> sudo
exit
```

## Clone repo, install packages, and reboot
As user:
```bash
git clone https://github.com/d4n13ly/dotfiles ~/projects/dotfiles
sudo -E ~/projects/dotfiles/scripts/install_packages.sh
sudo shutdown -r now
```

## Configure user environment
After reboot, in terminal:
```bash
~/project/dotfiles/scripts/user_config.sh
```
