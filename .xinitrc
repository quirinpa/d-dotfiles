#!/bin/sh

set -e
xset fp+ $HOME/.fonts
gpg-connect-agent /bye
xrdb $HOME/.Xresources
feh --bg-fill $HOME/.wallpapers/RuRa.jpg
unclutter &
panel &
sxhkd &
redshift -t 5700:3500 &
exec bspwm
wait
