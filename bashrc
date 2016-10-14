export TERM=screen-256color
export PATH="~/bin/pig-0.16.0/bin:${PATH}:~/.gem/ruby/2.2.0/bin"
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.102-1.b14.fc24.x86_64

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
