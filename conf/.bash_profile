export PATH=~/bin:/usr/local/bin:/usr/local/mysql/bin:/opt/local/lib/postgresql84/bin:$PATH

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagacad
export TERM=linux
export EDITOR="mate -w"
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth

alias ls='ls -G'
alias ll='ls -hl'

if [ -f ~/.profile ] ; then
  . ~/.profile
fi

if [ -f ~/.bash_local ] ; then
  . ~/.bash_local
fi

if [ -f /opt/local/etc/bash_completion ] ; then
  . /opt/local/etc/bash_completion
fi

if [ -f ~/.completion/rake.rb ] ; then
  complete -C ~/.completion/rake.rb -o default rake
fi

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(git::\1)/'
}

# http://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html
export PS1="\[\033[00m\]\u@\h\[\033[01;36m\] \W\[\033[31m\] \$(parse_git_branch) \[\033[00m\]$\[\033[00m\] "
