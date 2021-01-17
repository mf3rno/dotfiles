# {{{

# If not running interactively, don't do anything
if [[ $- != *i* ]]; then return; fi

# }}}
# {{{ env vars

# {{{ base

export USER=xf3rno
export SHELL=bash
export EDITOR=nvim
export HOME=/home/$USER
export PERSONAL_BIN=$HOME/bin
export PERSONAL_BASH_LIB=$PERSONAL_BIN/bash
export PASSWORD_STORE=$HOME/.password-store

# }}}
# {{{ tooling

# {{{ rvm/ruby

export RVM_BIN=$HOME/.rvm/bin
export GEM_HOME=$HOME/.rvm/gem/ruby-2.7.0
export GEM_PATH=$GEM_HOME/bin

# }}}
# {{{ go

export GOPATH=$HOME/go
export GOPATH_BIN=$HOME/go/bin

# }}}
# {{{ node/yarn

export NVM_BIN_PATH=$HOME/.nvm/versions/node/v15.3.0/bin
export YARN_BIN=$HOME/.yarn/bin

# }}}
# {{{ rust

export CARGO_PATH=$HOME/.cargo/bin

# }}}

# }}}
# {{{ bin

export USR_BIN=/usr/local/bin
export LOCAL_BIN=$HOME/.local/bin

# }}}
# {{{ TERM

export TERM=xterm-256color

# }}}

# }}}
# {{{ shortcuts

# {{{ system

shutdn() {
  shutdown -h -P now
}

kk() {
  sudo killall $@ -9
}

mnt() {
  sudo mount /dev/$@ /mnt
}

umnt() {
  sudo unmount /mnt
}

# }}}
# {{{ shell

x() {
  exit
}

c() {
  clear
}

# }}}
# {{{ git

gs() {
  git status
}

gc() {
  git clone $@
}

gcgh() {
  DEST=~/.src/github/$@

  if [[ -f $DEST ]]; then
    echo "$DEST already exists"
  else
    mkdir -p $DEST

    if [[ $@ == *$USER* ]]; then
      REPO_URL=git@github.com:$@
    else
      REPO_URL=https://github.com/$@
    fi

    git clone $REPO_URL $DEST
  fi

  cd $DEST
}

gcs() {
  git clone --depth=1 $@
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

gcm() {
  git commit -m "$@"
}

gl() {
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s%Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
}

ga() {
  git add -p $@
}

gd() {
  git diff $@
}

# }}}
# {{{ system services

jctl() {
sudo journalctl -u $@
}

jctlf() {
sudo journalctl -u $@ -f
}

sysup() {
sudo systemctl start $@
}

sysdn() {
sudo systemctl stop $@
}

sysst() {
sudo systemctl status $@
}

syson() {
sudo systemctl enable $@
}

sysoff() {
sudo systemctl disable $@
}

# }}}
# {{{ tmux

tmn() {
tmux new -s T
}

tma() {
tmux attach -t T
}

# }}}
# {{{ utilities

mkexec() {
chmod +x $@
}

# }}}

# }}}
# {{{ aliases

alias lah="lsd -lah"
alias ls="ls --color=auto"
alias ll='ls -lah --color=auto'
alias grep='grep --color'
alias vim="vi"
alias weechat-docker="docker container start weechat && docker container attach weechat"

# }}}
# {{{ powerline

export PROMPT_COMMAND='echo -n "[$USER@$HOSTNAME] $(pwd) "'

source $HOME/.bash-powerline.sh

# }}}
# {{{ path

PATH_MEMBERS=( \
  $RVM_BIN \
  $GOPATH_BIN \
  $YARN_BIN \
  $CARGO_PATH \
  $NVM_BIN_PATH \
  $PERSONAL_BIN \
  $LOCAL_BIN \
)

export PATH="$(printf "%s:" "${PATH_MEMBERS[@]}"):$PATH"

# }}}
