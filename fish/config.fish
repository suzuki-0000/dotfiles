export CODECOV_TOKEN=0eeedf54-576c-48db-99d0-83b0d2bdf77e
export CHANGELOG_GITHUB_TOKEN="c3778b3f0c2f91b66887b92ae5fc07dbcf483da6"
export OPENAI_API_KEY="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" 

export XCODE_XCCONFIG_FILE="/Users/nml_dev/ghq/cathage-helper.xcconfig"
export NVM_DIR="$HOME/.nvm"
export PATH="$HOME/.nodebrew/current/bin:$PATH"

#set PATH /opt/homebrew/bin $PATH
set -x PATH /opt/homebrew/bin $PATH
set -x PATH /usr/local/opt/openssl/bin $PATH

set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x PATH $HOME/.rbenv/bin $PATH
status --is-interactive; and source (rbenv init -|psub)

### basic - fish ###
alias fi='vim ~/.config/fish/config.fish'
alias fr='cd | . ~/.config/fish/config.fish'

### basic - primitive ###
alias ll='lsd -la'
alias cp="cp -p"
alias rm="rm -i"
alias mv="mv -i"
alias ps="ps aux"
alias dps="docker compose ps"
alias hosts="sudo vi /etc/hosts"
alias teee="tee >(pbcopy)"

### basic - git ###
alias gc='git checkout'
alias gcp='git branch | peco | xargs git checkout'
alias gs="git status"
alias gf="git branch -a --sort=-authordate | grep -v -e '->' -e '*' | perl -pe 's/^\h+//g' | perl -pe 's#^remotes/origin/##' |  peco | xargs git fetch origin"

alias gcm='git commit -m'
alias gb="git branch"
alias gca="git commit --amend"
alias gD="git branch --merged|egrep -v '\*|main'|xargs git branch -d"
alias gd='git branch | peco | xargs git branch -D'

alias gl='git log --graph --all --format="%x09%C(cyan bold)%an%Creset%x09%C(yellow)%h%Creset %C(magenta reverse)%d%Creset %s"'
alias see='gh repo view --web'
alias seep='gh pr view --web'

### peco - history ###
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

### peco - ghq ###
alias g='cd (ghq root)/(ghq list | peco)'


###########
# other 
###########
alias vimrc="vim ~/.vimrc"

export PATH="$PATH:/Users/ono/.bin"
