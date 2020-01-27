export CHANGELOG_GITHUB_TOKEN="c9862a1416f89f9d9ff3eac1da58468125f61bf2"
export YAHOO_EMAIL="kc_suzuki_1983"
export YAHOO_PASSWORD="steelbird996"
set -x PATH /usr/local/opt/openssl/bin $PATH
set -x PATH ~/.rbenv/bin $PATH
set -x LDFLAGS "-L/usr/local/opt/zlib/lib"
set -x CPPFLAGS "-I/usr/local/opt/zlib/include"

rbenv init - | source

set -x PATH $HOME/.pyenv/bin $PATH
. (pyenv init - | psub)


###########
# basic
###########
alias ps="ps aux"
alias ll="ls -aio"
alias cp="cp -p"
alias rm="rm -i"
alias mv="mv -i"
alias g='cd (ghq root)/(ghq list | peco)'
alias gh='hub browse (ghq list | peco | cut -d "/" -f 2,3)'
alias hosts="sudo vi /etc/hosts"

###########
# history
###########
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

###########
# git 
###########
alias gs="git status"
alias gd="git diff"
alias gb="git branch"

###########
# other 
###########
alias vimrc="vim ~/.vimrc"
