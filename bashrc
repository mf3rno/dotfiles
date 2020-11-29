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
export PASSWORD_STORE=$HOME/.password-store

# }}}
# {{{ gh-cli

export GIT_EDITOR=nvim
export GH_EDITOR=nvim
export BROWSER=firefox-developer-edition
export GH_PAGER=slit
export GLAMOUR_STYLE=dark

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

export GH_CLI_BIN=$HOME/src/github/cli/cli/bin

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
export PASSWORD_STORE_ENABLE_EXTENSIONS=true

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
  mkdir -p ~/src/github/$@
  git clone https://github.com/$@ ~/src/github/$@
  cd ~/src/github/$@
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
# {{{ pass
# TODO: Extract into helper

pcp() {
  pass -c $@
}

pass-new() {
  pass generate $@
  clear
  pass -c $@
  pushd .
  cd $PASSWORD_STORE
  gp
  popd
}

pass-gg() {
  pass otp g/google/otp
  pass -c g/google
}

pass-pmail() {
  pass otp c/protonmail/otp
  pass -c c/protonmail
}

pass-gh() {
  pass otp c/github/otp
  pass -c c/github
}

pass-ff() {
  pass otp g/firefox/otp
  pass -c g/firefox
}

pass-twitter() {
  pass otp s/twitter/otp
  pass -c s/twitter
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

gdmup() {
  sudo systemctl start gdm
}

gdmdn() {
  sudo systemctl stop gdm
}

# }}}
# {{{ system packages

pkgi() {
  sudo pacman -S $@
}

pkgd() {
  sudo pacman -R $@
}

pkgs() {
  sudo pacman -Ss $@
}

pkgu() {
  sudo pacman -Syyyuuu $@
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
alias vimbrc="vim ~/.bashrc"

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

source $HOME/src/github/alacritty/alacritty/extra/completions/alacritty.bash
source $HOME/.autojump/share/autojump/autojump.bash # cd w/ history
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
  $NVM_BIN_PATH \
  $PRIVATE_BIN \
  $LOCAL_BIN \
  $DEV_BIN \
  $FZF_BIN \
  $SNAP_PATH \
  $FF_DEV_PATH \
  $GH_CLI_BIN \
)

export PATH="$(printf "%s:" "${PATH_MEMBERS[@]}"):$PATH"

# }}}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
