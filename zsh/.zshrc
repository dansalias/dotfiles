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

# Custom lines
alias c="clear"
alias p="pwd"
alias v="vim"
alias t="tmux"
alias e="exit"

alias -g tconf=~/.tmux.conf
alias -g zconf=~/.zshrc
alias -g vconf=~/.vimrc
# End custom lines
