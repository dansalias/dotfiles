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

# st
(
  git clone https://git.suckless.org/st ~/pkg/st && cd ~/pkg/st

  ln  -s ~/projects/df/colors.h ~/pkg/st/colors.h

  cp config.def.h config.h

  mkdir ./patches

  curl -o ./patches/workingdir.diff \
    https://st.suckless.org/patches/workingdir/st-workingdir-20200317-51e19ea.diff

  curl -o ./patches/scrollback.diff \
    https://st.suckless.org/patches/scrollback/st-scrollback-ringbuffer-0.9.2.diff

  ls -1 ./patches | xargs -I patchfile patch -i ./patches/patchfile

  make clean install
)

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
