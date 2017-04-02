#!/bin/ksh -e

PATH=$HOME/bin:$PATH # FIXME (notify-send)
export GBROWSER=surf

xrdb -load .Xresources
xidle -timeout 300 -program "/usr/local/bin/slock" &

toggle_touchpad
xterm -ls &
xbanish &
exec bspwm
