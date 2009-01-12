export PATH=~/bin:/usr/local/bin:/usr/local/mysql/bin:$PATH
export PATH=$PATH:/Applications/Firefox.app/Contents/MacOS

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export TERM=linux
export EDITOR="mate -w"
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth

alias ls='ls -G'
alias ll='ls -hl'
alias svn_diff='svn diff --diff-cmd svn-viewdiff'

. ~/.profile

if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
fi
complete -C ~/.completion/rake.rb -o default rake

# GIT stuff
alias github="open \`git config -l | grep 'remote.origin.url' | sed -n 's/remote.origin.url=git@github.com:\(.*\)\/\(.*\).git/https:\/\/github.com\/\1\/\2/p'\`"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(git::\1)/'
}
parse_svn_branch() {
  parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk -F / '{print "(svn::"$1 "/" $2 ")"}'
}
parse_svn_url() {
  svn info 2>/dev/null | grep -e '^URL*' | sed -e 's#^URL: *\(.*\)#\1#g '
}
parse_svn_repository_root() {
  svn info 2>/dev/null | grep -e '^Repository Root:*' | sed -e 's#^Repository Root: *\(.*\)#\1\/#g'
}
export PS1="\[\033[00m\]\u@\h\[\033[01;34m\] \w\[\033[31m\]\$(parse_git_branch)\$(parse_svn_branch)\[\033[00m\]$\[\033[00m\] "
