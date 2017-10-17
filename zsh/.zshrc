# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/daniel/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# Aliases

  # general
  alias c="clear"
  alias p="pwd"
  alias v="vim"
  alias t="tmux"
  alias e="exit"
  alias l="ls -A --color --group-directories-first"

  # tree
  alias tree="tree -a -I 'node_modules|.git'"

  # git
  alias g="git"

  # config files
  alias -g tconf=~/.tmux.conf
  alias -g zconf=~/.zshrc
  alias -g vconf=~/.vimrc
  alias -g gconf=~/.gitconfig
