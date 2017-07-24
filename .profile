PKG_PATH=ftp://mirror.exonetric.net/pub/OpenBSD/`uname -r`/packages/`uname -m`/
PATH=$PATH:~/.local/bin:~/bin:/usr/games:/usr/local/jdk-1.8.0/bin

# VISUAL=vim
# EDITOR=ed
BROWSER=lynx
LC_CTYPE=en_US.UTF-8
export PKG_PATH PATH BROWSER LC_CTYPE

HISTFILE=~/.history

#set -o vi
set -o emacs
echo $LOGNAME@`hostname`

MAIL=/var/mail/$LOGNAME
MAILCHECK=600
[[ ! -s $MAIL ]] || [[ `tty` == /dev/ttyC* ]] || echo -e "\aYou have new mail!"
biff y

screen -ls | grep Detached | sed 's/^	\([^	]*\).*$/\1/'

red="\033[31m"
bold="\033[1m"
reset="\033[0m"

maybeerr() { err=$? && test $err != 0 && echo \\[$red\\]$err\  ; }

PS1="\$(maybeerr)\[$bold\]\$ \[$reset\]"

alias o="xdg-open"
cpdf() { pdftotext "$1" - | less ; }
yt() { youtube-dl -o - `xsel -o` | mplayer -; }
yt2() { mplayer $(youtube-dl -g `xsel -o`); }
upload() { curl --upload-file $1 https://transfer.sh/$1 ; }

alias ls="ls -F"
