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
source ~/.oh-my-zsh/custom/z.sh
precmd() {
  _z --add "$(pwd -P)"
}
###########
# history
###########
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
###########
# grunt 
###########
alias gw="grunt w"
###########
# git 
###########
alias gs="git status"
alias gb="git branch"
alias gd="git diff"
alias gl="git pull upstream develop"
alias gpo="git push origin develop"
alias gpu="git push upstream develop"
###########
# other 
###########
alias zrc="vim ~/.oh-my-zsh/custom/custom-aliases.zsh; source ~/.oh-my-zsh/custom/custom-aliases.zsh" 
alias vimrc="vim ~/.vimrc"
