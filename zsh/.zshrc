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

export COLORTERM=truecolor
export EDITOR=helix

# Style prompt
PROMPT='%F{green}%n@%m %F{blue}%~: %F{reset_color}'

# Add ruby gems to path
export PATH=/home/daniel/.local/bin:/home/daniel/.gem/ruby/2.5.0/bin:$PATH
export PATH=/home/daniel/.gem/ruby/3.0.0/bin:$PATH

# Add go binaries to path
export PATH=~/go/bin:$PATH

# Add deno to path
export PATH=/home/daniel/.deno/bin:$PATH

# Add npm globals to path
export PATH=/home/daniel/npm-global/bin:$PATH

# Environment variables
export VISUAL="vim"

# Aliases

  # general
  alias c="clear"
  alias p="pwd"
  alias r="ranger"
  alias h="helix"
  alias v="vim"
  alias y="yarn"
  alias m="ncmpcpp"
  alias e="exit"
  alias ll="ls -A -F --color --group-directories-first"
  alias l="ll -1"
  alias x="startx"
  alias g="git"
  alias cc="setxkbmap -option ctrl:nocaps"
  # alias ac="setxkbmap -option compose:ralt"
  alias ac="setxkbmap -option compose:rctl"
  alias hwc="sudo hwclock --systohc"
  alias tree="tree -a -I 'node_modules|dist|.git|.build|cdk.out|.vitepress' --dirsfirst"
  alias grep="grep --exclude-dir={.git,node_modules,dist,cdk.out,.build}"
  alias sd="sudo shutdown now"
  alias wifi="sudo wifi-menu"
  alias 4k="xrandr --output eDP1 --off --output DP1 --auto"
  alias tv="xrandr --output eDP1 --off --output DP1 --mode 1360x768 --scale 2x2"
  alias 1080="xrandr --output eDP1 --off --output DP1 --auto --scale 2x2 --panning 3840x2160"
  alias ikea="xrandr --fb 7040x3960 --output DP1 --mode 1920x1080 --scale 2x2 --panning 3840x2160 --output eDP1 --mode 3200x1800 --pos 3840x0"
  alias ikeaR="xrandr --fb 7040x3960 --output eDP1 --mode 3200x1800 --output DP1 --mode 1920x1080 --scale 2x2 --panning 3840x2160 --pos 3200x0" 
  alias laptop="xrandr --output eDP1 --auto --output DP1 --off"
  alias monitor="xrandr --output eDP1 --auto --output DP1 --mode 1360x768 --right-of eDP1 --scale 2x2"
  alias proj="xrandr --fb 5760x3240 --output DP1 --mode 1280x720 --scale 2x2 --panning 2560x1440 --output eDP1 --mode 3200x1800 --pos 2560x0"
  alias 1080p="xrandr --output eDP1 --off --output DP1 --mode 1920x1080"
  alias sc="ffmpeg -f x11grab -y -r 30 -s 3200x1800 -i :0.0 -vcodec huffyuv"
  alias ns=$HOME/scripts/node-switch.sh

  # config files
  alias -g zconf=~/.zshrc
  alias -g vconf=~/.vimrc
  alias -g hconf=~/.config/helix/config.toml
  alias -g gconf=~/.gitconfig
  alias -g iconf=~/.config/i3/config
  alias -g pconf=~/.config/polybar/config
  alias -g xconf=~/.Xresources
  alias -g cconf=~/.config/picom.conf

  # backup
  alias bkp="rsync --archive --delete --stats --human-readable --exclude node_modules --exclude .git"

  # reload
  alias rp="~/.config/polybar/launch.sh"
  alias rz=". zconf"

  # applications
  alias slack="/usr/bin/slack --force-device-scale-factor=2"
  alias rust="evcxr"

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

# # switch node version based on .nvmrc
# default_node_version=12.13.1
# chpwd() {
#   if [[ -f .nvmrc && -r .nvmrc ]]; then
#     ns switch "$(< .nvmrc)"
#   elif [[ $(node --version) != v$default_node_version ]]; then
#     ns switch $default_node_version
#   fi
# }

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# switch to $ST_PATH (to open terminal in same location)
if ! [ -z $ST_PATH ]; then
  cd "$ST_PATH"
fi

# tmp
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# bun completions
[ -s "/home/daniel/.bun/_bun" ] && source "/home/daniel/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
