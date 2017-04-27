#!/bin/ksh -e

PATH=$HOME/bin:$PATH
export PANEL_FIFO=/tmp/bar
export GBROWSER=browser

xrdb -load .Xresources
xidle -timeout 300 -program "/usr/local/bin/xlock" &

xmodmap $HOME/.xmodmaprc
keynav &

[[ ! -e ~/.xsession.local ]] || \
	. ~/.xsession.local

xbiff -geometry +5-5 &
xclock -geometry +60-12 &
xterm -geometry 80x30+5-60 &

exec cwm
# exec bspwm
