PKG_PATH=ftp://mirror.exonetric.net/pub/OpenBSD/`uname -r`/packages/`uname -m`/
PATH=$PATH:~/.local/bin:~/bin:/usr/games:/usr/local/jdk-1.8.0/bin

# VISUAL=vim
# EDITOR=ed
BROWSER=lynx
LC_CTYPE=en_US.UTF-8
export PKG_PATH PATH BROWSER

HISTFILE=~/.history

set -o emacs
echo $LOGNAME@`hostname`

[[ ! -s /var/mail/$LOGNAME ]] || echo You have mail!

red="\033[31m"
bold="\033[1m"
reset="\033[0m"

maybeerr() { err=$? && test $err != 0 && echo \\[$red\\]$err\  ; }

PS1="\$(maybeerr)\[$bold\]\$ \[$reset\]"

cpdf() { pdftotext "$1" - | less ; }
yt() { youtube-dl -o - `xsel -o` | mplayer -; }
yt2() { mplayer $(youtube-dl -g `xsel -o`); }
upload() { curl --upload-file $1 https://transfer.sh/$1 ; }

alias ls="ls -F"
