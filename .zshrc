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
# sanrenp
###########
alias aws="ssh -i ~/.ssh/id_rsa  suzuki_keishi@54.65.11.115 -p 55222"
###########
# ios
###########
alias ios_list="ios profiles:list -u keishi.1983@gmail.com -p steelbird996"
alias ios_devices="ios profiles:devices -u keishi.1983@gmail.com -p steelbird996"
alias ios_build="ipa build -d ipa"
#alias ios_dist="ipa distribute:hockeyapp -a f4d386904ed145f9a64fdf443731b634 -m 'released' -f ipa/maihama.ipa -d ipa/maihama.app.dSYM.zip"
#alias ios_dist="ipa distribute:deploygate -a bedfcbc6e413ead285271af7bf5dba3dc201b8d9 -m 'released' -f ipa/maihama.ipa -u 'suzuki-0000'"
alias ios_dist="curl -F "file=@ipa/maihama.ipa" -F "token=63b55da3740bc2c339fe783ca4d632b6a582e546" -F "message=sample" https://deploygate.com/api/users/suzuki-0000/apps"
#
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
# sakura
###########
alias sakura="ssh suzuki_keishi@49.212.182.54 -p 10022"
###########
# other 
###########
alias virc="vim ~/.bashrc; source ~/.bashrc"
alias vimrc="vim ~/.vimrc; source ~/.vimrc"
alias zrc="vim ~/.zshrc; source ~/.zshrc"
###########
# memcached
###########
alias memkill="sudo killall memcached"
alias memstart="/usr/local/bin/memcached -d -m 6024 -I 10m"
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
