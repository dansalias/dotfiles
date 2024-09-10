# ln ~/.zshrc

COLORTERM=truecolor
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
EDITOR=helix
PROMPT='%F{blue}%~: %F{reset_color}'

setopt appendhistory autocd extendedglob
bindkey -v
autoload -Uz compinit; compinit

alias c="clear"
alias e="exit"
alias g="git"
alias h="helix"
alias l="ls -1AF --color --group-directories-first"
alias sd="sudo shutdown now"
alias t="tree -a --dirsfirst --gitignore -I .git"
alias wifi="sudo wifi-menu"
alias x="startx"

alias -g gconf='~/dotfiles/git/*'
alias -g hconf='~/dotfiles/helix/*'
alias -g iconf='~/dotfiles/i3/*'
alias -g pconf='~/dotfiles/polybar/*'
alias -g xconf='~/dotfiles/x/*(D)'
alias -g zconf='~/dotfiles/zsh/*(D)'

dotfiles () {
  ~/dotfiles/${1}.sh "${@:2}"
}

mkcd () {
  mkdir -p "$1"
  cd "$1"
}

. ~/dotfiles/zsh/paths.sh
