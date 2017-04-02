JAVA_HOME=/usr/local/jdk-1.8.0
GRADLE_HOME=~/gradle-2.11
PATH=$HOME/bin:$PATH:$JAVA_HOME/bin:$GRADLE_HOME/bin

. ~/.profile.local

export VISUAL="vim"
export EDITOR="ed"
export BROWSER="lynx"

HISTFILE=~/.history
INPUTRC=~/.inputrc

alias ddg="sr duckduckgo"

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

pre=
test $SHELL == /bin/ksh && \
	set -o vi || \
	pre=\ 

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
