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

# Style prompt
PROMPT='%F{green}%n@%m %F{blue}%~: %F{reset_color}'

# Add ruby gems to path
export PATH=/home/daniel/.gem/ruby/2.4.0/bin:$PATH

# Environment variables
export VISUAL="vim"

# Aliases

  # general
  alias c="clear"
  alias p="pwd"
  alias v="vim"
  alias m="ncmpcpp"
  alias e="exit"
  alias l="ls -A -F --color --group-directories-first"
  alias x="startx"
  alias g="git"
  alias tree="tree -a -I 'node_modules|.git'"

  # config files
  alias -g tconf=~/.tmux.conf
  alias -g zconf=~/.zshrc
  alias -g vconf=~/.vimrc
  alias -g gconf=~/.gitconfig
  alias -g iconf=~/.config/i3/config
  alias -g pconf=~/.config/polybar/config
  alias -g xconf=~/.Xresources
  alias -g cconf=~/.config/compton.conf

  # reload
  alias rp="pkill -USR1 polybar"
  alias rz=". zconf"

# Utility
mkcd () {
  mkdir "$1"
  cd "$1"
}

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
