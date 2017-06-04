#!/bin/ksh -e

PATH=$HOME/bin:$PATH
export PANEL_FIFO=/tmp/bar
export GBROWSER=dillo

xidle -timeout 300 -program "/usr/local/bin/xlock" &

xmodmap $HOME/.xmodmaprc
keynav &

exec wmii
