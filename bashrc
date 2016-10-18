# If not running interactively, don't do anything
if [[ $- != *i* ]]; then return; fi

export TERM=screen-256color
export GOROOT="/home/cris/.gimme/versions/go1.7.1.linux.amd64"
export GOPATH="/home/cris/.go"
export GIMME_ENV="/home/cris/.gimme/envs/go1.7.1.env"
export PATH="$GOPATH/bin:~/bin/weechat/bin:~/.gem/ruby/2.2.0/bin:$PATH"

# tmuxinator
source ~/bin/tmuxinator.bash
export EDITOR=vim
export SHELL=bash

# git shortcuts
gs() {
  git status
}

gp() {
  git push -u origin HEAD
}

gpf() {
  git push -u origin HEAD --force
}

gcam() {
  git commit -am "$@"
}

gl() {
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s%Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
}

ga() {
  git add -p
}

gd() {
  git diff
}

export NVM_DIR="/home/cris/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

nvm use 6.0.0
