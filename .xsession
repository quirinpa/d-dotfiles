#!/bin/ksh -e

PATH=$HOME/bin:$PATH
export PANEL_FIFO=/tmp/bar
export GBROWSER=browser
export MAIL MAILCHECK

xidle -timeout 300 -program "/usr/local/bin/xlock" &

xmodmap $HOME/.xmodmaprc
keynav &

# xbiff -geometry +5-5 &
# xclock -geometry +60-12 &
# xterm -geometry +0-60 &
# dillo -geometry 923x900+750+5 &
# xbattbar &

# exec cwm

exec wmii
