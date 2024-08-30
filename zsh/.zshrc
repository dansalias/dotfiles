# ln ~/.zshrc

COLORTERM=truecolor
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
EDITOR=helix
PROMPT='%F{green}%n@%m %F{blue}%~: %F{reset_color}'

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

alias -g gconf=~/.gitconfig
alias -g hconf=~/.config/helix/config.toml
alias -g iconf=~/.i3/config
alias -g pconf=~/.config/polybar/config
alias -g xconf=~/.Xresources
alias -g zconf=~/.zshrc

mkcd () {
  mkdir -p "$1"
  cd "$1"
}

# bun 
[ -s "/home/daniel/.bun/_bun" ] && source "/home/daniel/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
