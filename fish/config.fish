export CHANGELOG_GITHUB_TOKEN="c3778b3f0c2f91b66887b92ae5fc07dbcf483da6"
export YAHOO_EMAIL="kc_suzuki_1983"
export YAHOO_PASSWORD="steelbird996"
export XCODE_XCCONFIG_FILE="/Users/nml_dev/ghq/cathage-helper.xcconfig"

set -x PATH /usr/local/opt/openssl/bin $PATH
set -x PATH $HOME/.rbenv/bin $PATH
set -x PATH $HOME/.pyenv/shims $PATH
set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x LDFLAGS "-L/usr/local/opt/zlib/lib"
set -x CPPFLAGS "-I/usr/local/opt/zlib/include"

#set -x PATH $HOME/.pyenv/bin $PATH
#. (pyenv init - | psub)

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
alias gl='git log --graph --all --format="%x09%C(cyan bold)%an%Creset%x09%C(yellow)%h%Creset %C(magenta reverse)%d%Creset %s"'

###########
# other 
###########
alias vimrc="vim ~/.vimrc"
