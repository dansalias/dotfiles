# ln ~/.xinitrc

export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_AUTO_SCREEN_SCALE_FACTOR=1

COLORS=$(cat ~/dotfiles/colors.h)
echo "${COLORS//\"}" > ~/.xcolors
xrdb -load ~/dotfiles/x/.xdefaults

light -N 1

exec i3
