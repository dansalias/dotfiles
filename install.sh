mkdir ~/pkg

# git
pacman -S --needed git

# yay
(
  git clone https://aur.archlinux.org/yay.git ~/pkg/yay
  cd ~/pkg/yay
  makepkg -si
)

# packages/aur
yay -S --noconfirm \
  alacritty \
  aws-cli-v2 \
  chromium \
  feh \
  helix \
  i3-wm \
  polybar \
  ripgrep \
  ttf-inconsolata \
  xorg-server \
  xorg-xinit \

# node
curl https://get.volta.sh | bash
volta install node

# bun
curl -fsSL https://bun.sh/install | bash

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# language servers
yay -S --noconfirm \
  clang \
  marksman \

rustup component add rust-analyzer

npm i -g \
  bash-language-server \
  vscode-langservers-extracted \
  typescript \
  typescript-language-server \
  @vue/language-server \
  @vue/typescript-plugin \
