export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
setxkbmap -option ctrl:nocaps
setxkbmap -option compose:ralt
xrdb -load ~/.Xresources &
exec i3
