#!/bin/bash -x
DF=$HOME/projects/dotfiles
ln -sf $DF/zsh/.zshrc $HOME
ln -sf $DF/vim/.vimrc $HOME
ln -sf $DF/tmux/.tmux.conf $HOME
ln -sf $DF/git/.gitconfig $HOME
ln -sf $DF/gnome/user-dirs.conf $HOME/.config
ln -sf $DF/gnome/user-dirs.dirs $HOME/.config
ln -sf $DF/gnome/bookmarks $HOME/.config/gtk-3.0
