# ln ~/.zshrc

COLORTERM=truecolor
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
EDITOR=helix
PROMPT='%F{blue}%~: %F{reset_color}'
LC_COLLATE=C

setopt appendhistory autocd extendedglob
bindkey -v
autoload -Uz compinit; compinit

alias c="clear"
alias cb="wl-copy"
alias e="exit"
alias g="git"
alias h="helix"
alias l="ls -1AF --color --group-directories-first"
alias sd="sudo shutdown now"
alias srv="npx servor --reload"
alias t="tree -a --dirsfirst --gitignore -I .git"
alias tz="timedatectl set-timezone"
alias u="~/dotfiles/update.sh"
alias wifi="sudo wifi-menu"
alias x="startx"

alias -g gconf='~/dotfiles/git/*'
alias -g hconf='~/dotfiles/helix/**/*.toml'
alias -g iconf='~/dotfiles/i3/*'
alias -g pconf='~/dotfiles/polybar/*'
alias -g piconf='~/dotfiles/picom/*'
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
