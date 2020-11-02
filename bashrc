# {{{

# If not running interactively, don't do anything
if [[ $- != *i* ]]; then return; fi

# }}}
# {{{ env vars

# {{{ base

export USER=f3rno
export HOME=/home/$USER
export EDITOR=nvim
export SHELL=bash

# }}}
# {{{ fzf

# {{{ FZF ag (disabled)

export FZF_DEFAULT_COMMAND='ag --hidden --ignore-dir={.git,.undodir,docs/dist,node_modules,bower_components,dist} -g ""'

# }}}
# {{{ FZF fd

# export FZF_DEFAULT_COMMAND='fd --type f'

# }}}

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_BIN=$HOME/.fzf/bin

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

export N_BIN_PATH=$HOME/.n/bin
export N_PREFIX=$HOME/.n/node
export N_NODE_BIN_PATH=$N_PREFIX/bin
export YARN_BIN=$HOME/.yarn/bin

# }}}
# {{{ rust

export CARGO_PATH=$HOME/.cargo/bin

# }}}

# }}}
# {{{ snap

export SNAP_PATH=/snap/bin

# }}}
# {{{ bin

export USR_BIN=/usr/local/bin
export PRIVATE_BIN=$HOME/bin/exec
export LOCAL_BIN=$HOME/.local/bin
export DEV_BIN=$HOME/bin/dev-sessions
export FF_DEV_PATH=$HOME/bin/firefox-dev

# }}}
# {{{ pass

# source ~/.password-store/.env

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
  killall $@ -9
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
# {{{ dnf

sdi() {
  sudo dnf install -y $@
}

ds() {
  dnf search $@
}

# }}}
# {{{ tmux

tmn() {
  tmux new -s main
}

tma() {
  tmux attach -t main
}

# }}}

# }}}
# {{{ aliases

# convenience
# lsd disabled due to poor visiblity on white bg, no color scheme support
# alias ls="lsd"
# alias ll="lsd -lh"
# alias lah="lsd -lah"
alias ls="ls --color=auto"
alias ll='ls -lah --color=auto'
alias grep='grep --color'
alias cat="bat"
alias vim="nvim"
alias dtrx="decompress $@ --out-dir $@"

# }}}
# {{{ bookmarks: https://dmitryfrank.com/articles/shell_shortcuts
# cdg (fzf bookmark cd via $HOME/.cdg_paths)
unalias cdg 2> /dev/null

cdg() {
  local dest_dir=$(cdscuts_glob_echo | fzf )

  if [[ $dest_dir != '' ]]; then
    cd "$dest_dir"
  fi
}

export -f cdg > /dev/null
set -o noclobber # prevent redirect overwriting existing files
shopt -s autocd # cd by entering path with no prefix

# }}}
# {{{ plugins/autocomplete

source /etc/profile.d/autojump.sh # cd w/ history
source $HOME/.bash-powerline.sh # prompt
source <(kitty + complete setup bash)
# source $HOME/.npm-completion-fast/npm-completion-fast.bash
[ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash

# Via https://github.com/jez/vim-superman
complete -o default -o nospace -F _man vman

# source $HOME/code/github/irondoge/bash-wakatime/bash-wakatime.sh
# source $HOME/.node_bash_completion

# }}}
# {{{ path

PATH_MEMBERS=( \
  $RVM_BIN \
  $GOPATH_BIN \
  $YARN_BIN \
  $CARGO_PATH \
  $N_BIN_PATH \
  $N_NODE_BIN_PATH \
  $PRIVATE_BIN \
  $LOCAL_BIN \
  $DEV_BIN \
  $FZF_BIN \
  $SNAP_PATH \
  $FF_DEV_PATH \
)

export PATH="$(printf "%s:" "${PATH_MEMBERS[@]}"):$PATH"

# }}}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
