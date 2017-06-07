#!/bin/ksh -e

export LC_CTYPE=en_US.UTF-8
export BROWSER=dillo
PATH=$HOME/bin:$PATH

xrdb -load ~/.Xresources
xidle -timeout 300 -program "/usr/local/bin/xlock" &

toggle_touchpad
xmodmap $HOME/.xmodmaprc
keynav &

# xbiff -geometry +5-5 &
# xclock -geometry +60-12 &
# xterm -geometry +0-60 &
# dillo -geometry 923x900+750+5 &
# xbattbar &

# exec cwm

# exec wmii
# exec dwm
exec ratpoison
