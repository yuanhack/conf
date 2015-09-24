
test -s ~/.aliasrc && . ~/.aliasrc || true
test -s /etc/bashrc && . /etc/bashrc || true
test -s ~/.gitfunc && . ~/.gitfunc || true

##############################

# function
cdl()
{
    cd $1
    cl
}

cdfd()
{
    cd /proc/$1/fd
}

rm1()
{
	if [ $# -lt 1 ]; then
		echo missing operand
		return 1
	fi

	if [ ! -d ~/tmp ]; then
		mkdir -p ~/tmp
	fi  
	mv $@ ~/tmp
	return $?
}
rm2()
{
	test $# -lt 1 && echo missing operand && return 1
	test ! -d ~/tmp && mkdir -p ~/tmp
	mv $@ ~/tmp
	return $?
}
alias rm='rm2'

###########################

PATH=/usr/local/bin:/sbin:/usr/sbin:~/bin:~/bin:/repository/bin/:$PATH:.

#PS1='[\e[31m$?\e[m \e[36m\t\e[m \w]\n\e[35m\u@\h\e[m \$ '
#PS1='[\e[31m$?\e[m \e[36m\t\e[m \e[35m\u@\h\e[m]\n\w \$ '
PS1='\e[31m$?\e[m \e[36m\t\e[m \e[35m\u@\h\e[m\n[\w] \$ '
#PS1='[\e[31m$?\e[m \e[36m\t\e[m \e[35m\u@\h\e[m] \$ '

# 自定义依据 uid==0(root) 追加后缀
#if [ $UID -eq 0 ]; then
#        PS1=$PS1'# '
#else
#        PS1=$PS1'> '
#fi

set -o ignoreeof


