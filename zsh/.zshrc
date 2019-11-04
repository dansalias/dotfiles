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
export PATH=/home/daniel/.local/bin:/home/daniel/.gem/ruby/2.5.0/bin:$PATH

# Add go binaries to path
export PATH=~/go/bin:$PATH

# Load nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Environment variables
export VISUAL="vim"

# Aliases

  # general
  alias c="clear"
  alias p="pwd"
  alias r="ranger"
  alias v="vim"
  alias y="yarn"
  alias m="ncmpcpp"
  alias e="exit"
  alias ll="ls -A -F --color --group-directories-first"
  alias l="ll -1"
  alias x="startx"
  alias g="git"
  alias cc="setxkbmap -option ctrl:nocaps"
  alias hwc="sudo hwclock --systohc"
  alias tree="tree -a -I 'node_modules|.git'"
  alias grep="grep --exclude-dir={.git,node_modules,dist}"
  alias sd="sudo shutdown now"
  alias wifi="sudo wifi-menu"
  alias 4k="xrandr --output eDP1 --off --output DP1 --auto"
  alias 1080="xrandr --output eDP1 --off --output DP1 --auto --scale 2x2 --panning 3840x2160 && feh --bg-fill ~/projects/dotfiles/ui/arch_linux_3840x2400.png"
  alias 1080p="xrandr --output eDP1 --off --output DP1 --auto 1920x1080"
  alias sc="ffmpeg -f x11grab -y -r 30 -s 3200x1800 -i :0.0 -vcodec huffyuv"

  # config files
  alias -g zconf=~/.zshrc
  alias -g vconf=~/.vimrc
  alias -g gconf=~/.gitconfig
  alias -g iconf=~/.config/i3/config
  alias -g pconf=~/.config/polybar/config
  alias -g xconf=~/.Xresources
  alias -g cconf=~/.config/compton.conf

  # backup
  alias bkp="rsync --archive --delete --stats --human-readable --exclude node_modules"

  # reload
  alias rp="~/.config/polybar/launch.sh"
  alias rz=". zconf"

# Utility
mkcd () {
  mkdir -p "$1"
  cd "$1"
}

# Image editing
halve () {
  convert "$1" -resize 50% "$1"
}

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='find -L * -type d -name "node_modules" -prune -o -type d -name ".git" -prune -o -type f -print'

# HiDPI settings
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
