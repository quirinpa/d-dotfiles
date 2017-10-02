# VARS & options {{{
PKG_PATH=ftp://mirror.exonetric.net/pub/OpenBSD/`uname -r`/packages/`uname -m`/
PATH=$PATH:~/.local/bin:~/bin:/usr/games:/usr/local/jdk-1.8.0/bin
PATH=$PATH:~/.npm-packages/bin
BROWSER=lynx
#VISUAL=vi
#EDITOR=ed
LC_CTYPE=en_US.UTF-8
HISTFILE=~/.history
export PKG_PATH PATH BROWSER LC_CTYPE

set -o vi
# colors {{{
magenta="\033[35m"
white="\033[37m"
green="\033[32m"
red="\033[31m"
bold="\033[1m"
reset="\033[0m"
# }}}
# }}}
# init {{{
screen -ls | grep Detached | sed 's/^	\([^	]*\).*$/\1/'
# mail {{{
MAIL=/var/mail/$LOGNAME
MAILCHECK=600
[[ ! -s $MAIL ]] || [[ `tty` == /dev/ttyC* ]] || echo -e "\aYou have new mail!"
biff y
# }}}
echo -n $magenta`hostname`\ 
# }}}
# Prompt {{{
maybeerr() { err=$? && test $err != 0 && echo \\[$red\\]$err\  ; }

PS1="\$(maybeerr)\[$green\]"
[ ! -n "$SSH_CLIENT" ] || PS1="$PS1`hostname` "
PS1="$PS1\[$bold\]\$ \[$reset\]"
# }}}
# aliases {{{
alias o="xdg-open"
cpdf() { pdftotext "$1" - | less ; }
yt() { youtube-dl -o - `xsel -o` | mplayer -; }
yt2() { mplayer $(youtube-dl -g `xsel -o`); }
upload() { curl --upload-file $1 https://transfer.sh/$1 ; }

alias ls="ls -F"
alias lanmap="nmap -sP 192.168.1.0/24"
# }}}
