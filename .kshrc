export SSH_AUTH_SOCK="/run/user/$(id -u)/gnupg/S.gpg-agent.ssh"

set -o emacs
if [[ $TERM == vt220 ]] || [[ $TERM == linux ]]; then
	bold="\033[1m"
	bright() {
		echo -e "\033[3$1m"
	}
else
	bold=""
	bright() {
		echo -e "\033[9$1m"
	}
fi

maybeerr() {
	err=$?
	[[ $err == 0 ]] || \
		echo -e "`bright 1`$err "
}

shortpwd() {
	[[ ${PWD#$HOME} == $PWD ]] && echo $PWD || echo \~${PWD#$HOME} 
}

echo -ne $USER@$(hostname)\ 
PS1="$bold\$(maybeerr)`bright 7`\$(shortpwd) `bright 4`$ `echo -e "\033[0m"`"
alias ls="ls -F"
