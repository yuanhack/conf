
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

PATH=$PATH:/usr/local/bin:/sbin:/usr/sbin:~/bin:~/bin:/repository/bin/:.

#PS1='[\u@\h \w]'
#PS1='$? \[[1m[35m\]\u@\h:\w \[[0;10m\]'
#PS1='($?)\[[1m[35m\]:\w\n\u@\h:[\W]> \[[0;10m\]'
#PS1='($?)\[[1m[35m\]:\w\n\u@\h > \[[0;10m\]'
#PS1='\[[0m[35m\]($?)\[[0;10m\][\u@\h \W] '
#PS1='\[[1m[35m\]$?:\w\n\[[0;10m\]\u@\h '

#PS1='\[[1m[31m\]$?\[[0;10m\] \[[1m[35m\]\u@\h\[[0;10m\]:\[[1m[5m\]\w\[[0;10m\] \$ '
#PS1='\[[1m[31m\]$? \[[1m[35m\]\u@\h:\[[1m[5m\]\w\[[0;10m\] \$ '

# 另一种新的格式风格，都是明文无特殊控制符支持鼠标复制粘贴，这点很好
#PS1='[\[\e[32m\]#\##\[\e[31m\]\u@\[\e[36m\]\h \w]\$\[\e[m\]'
PS1='[\[\e[31m\]$?\[\e[m\] \t \[\e[33m\]\u@\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]] \$ '

# 自定义依据 uid==0(root) 追加后缀
#if [ $UID -eq 0 ]; then
#        PS1=$PS1'# '
#else
#        PS1=$PS1'> '
#fi

set -o ignoreeof


