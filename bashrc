# If not running interactively, don't do anything
if [[ $- != *i* ]]; then return; fi

export TERM=screen-256color
export PATH="$GOPATH/bin:~/bin/weechat/bin:~/.gem/ruby/2.2.0/bin:$PATH"

# tmuxinator
#source ~/bin/tmuxinator.bash
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

export NVM_DIR="/home/f3rno/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
