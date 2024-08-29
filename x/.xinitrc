# ln ~/.xinitrc

export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_AUTO_SCREEN_SCALE_FACTOR=1

feh --bg-center ~/projects/dotfiles/ui/backgrounds/arch_linux_3840x2400.jpg

COLORS=$(cat ~/projects/df/colors.h)
echo "${COLORS//\"}" > ~/.xcolors
xrdb -load ~/projects/df/x/.xdefaults

exec i3
