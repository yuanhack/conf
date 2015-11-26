
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

####################################################################
# CentOS Linux release 7.0.1406 (Core) default PATH:
#   /usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:~/bin
####################################################################
PATH=/stash/bin/:$PATH
PATH=~/bin:$PATH
PATH=.:$PATH

export EDITOR=~/bin/vim

#PS1='\e[31m$?\e[m \e[36m\t\e[m \e[35m\u@\h\e[m\n[\w] \$ '

# 自定义依据 uid==0(root) 追加后缀
#if [ $UID -eq 0 ]; then
#        PS1=$PS1'# '
#else
#        PS1=$PS1'> '
#fi

function color_my_prompt {
    local __user_and_host="\[\033[01;32m\]\u@\h"
    local __cur_location="\[\033[01;34m\]\w"
    local __git_branch_color="\[\033[31m\]"
    #local __git_branch="\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[35m\]$"
    local __last_color="\[\033[00m\]"
    #export PS1="$? $__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
    export PS1="\e[31m$? \e[36m\t \e[35m\u@\h \e[32m$__git_branch \e[m\n[\w] \\$ "
}
color_my_prompt

set -o ignoreeof


