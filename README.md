# dotfiles
Opinionated dotfiles for bootstrapping a clean Debian installation.

## Installation

```bash
wget -q0 https://raw.githubusercontent.com/kiwidan92/dotfiles/master/bootstrap.sh | bash -s
```

Or if you prefer not to source an externally hosted shell script:

```bash
sudo apt-get update && apt-get install git
git clone https://github.com/kiwidan92/dotfiles.git ~/projects/dotfiles
cd ~/projects/dotfiles && ./bootstrap.sh
```
