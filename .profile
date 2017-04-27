# JAVA_HOME=/usr/local/jdk-1.8.0
export PKG_PATH=ftp://mirror.exonetric.net/pub/OpenBSD/6.0/packages/i386/
PATH=$PATH:~/.local/bin:~/bin:/usr/games:$JAVA_HOME/bin

. ~/.profile.local

export VISUAL="vi"
export EDITOR="ed"
export BROWSER="lynx"

HISTFILE=~/.history
set -o emacs

shortpwd() { 
	[[ ${PWD#$HOME} == $PWD ]] && \
		echo $PWD\  || echo \~${PWD#$HOME}\  ; }

SITE=$LOGNAME@`hostname`

if [[ $TERM == xterm* ]]; then
	title() {
		p="`shortpwd` "
		echo -ne "]2;$SITE: $p"
	}
	tpwd() { true; }
else
	title() { true; }
	alias tpwd=shortpwd
	export TERM=ansi
fi

# pre=" "
# [[ $SHELL != /bin/ksh ]] || pre=

p="\[`tput bold`\]"
test $LOGNAME == root && \
	ep=$p"\[`tput setaf 1`\]#" || \
	p=$p"\[`tput setaf 0`\]$"

maybeerr() { err=$? && test $err != 0 && echo $err\  ; }

pre=$pre"\[`tput setaf 1`\]"
mid="\[`tput setaf 7`\]"
end="\[`tput setaf 4`\]$p \[`tput sgr0`\]"

PS1=$pre"\$(maybeerr)"$mid"\[\$(title)\]\$(tpwd)"$end
alias ls="ls -F"
