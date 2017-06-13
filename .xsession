#!/bin/ksh -e

export LC_CTYPE=en_US.UTF-8

export BROWSER=dillo

export MENU="dmenu -l 50"

PATH=$HOME/bin:$PATH

xrdb -load ~/.Xresources
xidle -timeout 300 -program "/usr/local/bin/xlock" &

[[ `hostname` == qb* ]] || toggle_touchpad
xmodmap $HOME/.xmodmaprc
keynav &

exec dwm
exec st -e screen
