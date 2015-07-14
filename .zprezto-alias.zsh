#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

###########
# Source Prezto.
###########
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

###########
# basic
###########
alias -g G="| grep"
alias -g N="> /dev/null"
alias S="sudo "
alias SV="sudo vim"
alias H="history"
alias ps="ps aux"
alias ll="ls -aio"
alias cp="cp -p"
alias rm="rm -i"
alias mv="mv -i"
alias hosts="sudo vi /etc/hosts"
###########
# autojump
###########
_Z_CMD=j
. /Users/a12556/workspace/z/z.sh
precmd() {
  _z --add "$(pwd -P)"
}
###########
# ios
###########
###########
# grunt 
###########
alias gw="grunt w"
###########
# git 
###########
alias gs="git status"
alias gd="git diff"
alias gl="git pull upstream develop"
alias gpo="git push origin develop"
alias gpu="git push upstream develop"
###########
# other 
###########
alias virc="vim ~/.bashrc; source ~/.bashrc"
alias vimrc="vim ~/.vimrc; source ~/.vimrc"
alias zrc="vim ~/.zshrc; source ~/.zshrc"
###########
# ruby
###########
eval export PATH="/Users/a12556/.rbenv/shims:${PATH}"
source "/usr/local/Cellar/rbenv/0.4.0/libexec/../completions/rbenv.zsh"
rbenv rehash 2>/dev/null
rbenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval `rbenv "sh-$command" "$@"`;;
  *)
    command rbenv "$command" "$@";;
  esac
}

# The next line updates PATH for the Google Cloud SDK.
source '/Users/a12556/y/google-cloud-sdk/path.zsh.inc'
