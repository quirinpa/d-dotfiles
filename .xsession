#!/bin/ksh -e

PATH=$HOME/bin:$PATH # FIXME (notify-send)
BROWSER=surf

/usr/X11R6/bin/xrdb -load .Xresources
xidle -timeout 300 -program "/usr/local/bin/slock" &

toggle_touchpad
xterm -ls &
exec bspwm
