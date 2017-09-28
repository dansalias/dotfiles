# dotfiles
My dotfiles and scripts for bootstrapping a clean Debian installation.

## Disclaimer
This repo serves as a public store for my configuration and installation files. It is designed to allow me to setup a fresh installation of Debian, with all of the essential software I use for web development, using a single command.
Feel free to fork the repo and/or use it as inspiration for your own dotfiles. Don't use the repo without first reviewing the code, as it is a reflection of my own personal needs and tastes.

## Installation

```bash
wget -q0 https://raw.githubusercontent.com/deeayen/dotfiles/master/bootstrap.sh | bash -s
```

Or if you prefer not to source an externally hosted shell script:

```bash
sudo apt-get update && apt-get install git
git clone https://github.com/deeayen/dotfiles.git ~/projects/dotfiles
cd ~/projects/dotfiles && ./bootstrap.sh
```
