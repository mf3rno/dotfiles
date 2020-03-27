# If not running interactively, don't do anything
if [[ $- != *i* ]]; then return; fi


export EDITOR=vim
export SHELL=bash
export GEM_HOME=~/.rvm/gem/ruby-2.7.0
export GEM_PATH=~/.rvm/gems/ruby-2.7.0@global/bin
export NVM_DIR=~/.nvm
export GOPATH=~/go
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore node_modules --ignore bower_components --ignore dist --ignore build --ignore db -g ""'

export PATH="$GOPATH/bin:/snap/bin:~/bin:~/bin/bfx-hf-ui:~/.local/bin:~/.rvm/rubies/default/bin:~/.rvm/gems/default/bin:~/.rvm/bin:~/bin/nvim/bin:/lusr/local/bin:$PATH"

export TERM=xterm-256color

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

# convenience aliases
alias ls="lsd"
alias cat="bat"

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
