setxkbmap -option ctrl:nocaps
setxkbmap -option compose:ralt
unclutter -grab -idle 1 &
xrdb -load ~/.Xresources &
exec i3
