#!/bin/ksh -e

# $HOME/bin must go first because of notify-send FIXME
PATH=$HOME/bin:$PATH

/usr/X11R6/bin/xrdb -load .Xresources
feh --bg-fill lain.jpg

toggle_touchpad
exec bspwm

# redshift -t 5700:3500 &
