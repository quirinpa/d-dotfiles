export PKG_PATH=ftp://mirror.exonetric.net/pub/OpenBSD/6.0/packages/i386/
export PATH=$PATH:~/.local/bin:~/bin:/usr/games:/usr/local/jdk-1.8.0/bin

# export VISUAL=vim
# export EDITOR=ed
<<<<<<< Updated upstream
export BROWSER=lynx

HISTFILE=~/.history

=======
# export BROWSER=dillo

HISTFILE=~/.history

# LOGNAME=`logname`

>>>>>>> Stashed changes
set -o emacs
echo $LOGNAME@`hostname`
red="\033[31m"
bold="\033[1m"
reset="\033[0m"
<<<<<<< Updated upstream

maybeerr() { err=$? && test $err != 0 && echo \\[$red\\]$err\  ; }

PS1="\$(maybeerr)\[$bold\]\$ \[$reset\]"

export LC_CTYPE=en_US.UTF-8

cpdf() { pdftotext "$1" - | less ; }
yt() { youtube-dl -o - `xsel -o` | mplayer -; }
yt2() { mplayer $(youtube-dl -g `xsel -o`); }
upload() { curl --upload-file $1 https://transfer.sh/$1 ; }
=======

maybeerr() { err=$? && test $err != 0 && echo \\[$red\\]$err\  ; }

PS1="\$(maybeerr)\[$bold\]\$ \[$reset\]"

export LC_CTYPE=en_US.UTF-8
>>>>>>> Stashed changes
