#!/bin/ksh -e

PATH=$HOME/bin:$PATH # FIXME (notify-send)
export GBROWSER=surf

xrdb -load .Xresources
xidle -timeout 300 -program "/usr/local/bin/slock" &

if test $(hostname) == "qant.lan"; then
	toggle_touchpad
	xbanish &
fi

xterm -ls &
exec bspwm
