# If not running interactively, don't do anything
if [[ $- != *i* ]]; then return; fi

export EDITOR=nvim
export SHELL=bash
export N_PREFIX=~/.n/node

# export FZF_DEFAULT_COMMAND='ag --hidden --ignore-dir={.git,.undodir,docs/dist,node_modules,bower_components,dist} -g ""'
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export GEM_HOME=~/.rvm/gem/ruby-2.7.0

export GEM_PATH=~/.rvm/gem/ruby-2.7.0/bin
export GOPATH=~/go
export GOPATH_BIN=~/go/bin
export GH_CLI_PATH=~/code/vendor/cli-apps/gh-cli
export N_BIN_PATH=~/.n/bin
export N_NODE_BIN_PATH=~$N_PREFIX/bin
export SNAP_PATH=/snap/bin
export PRIVATE_BIN=~/bin
export PRIVATE_CDG_BIN=~/bin
export LOCAL_BIN=~/.local/bin
export RVM_BIN=~/.rvm/bin
export USR_BIN=/usr/local/bin
export DEV_BIN=~/bin/dev-sessions
export YARN_BIN=~/.yarn/.bin
export FZF_BIN=~/.fzf/bin
export NVIM_SUPERMAN_PATH=~/.nvim-plugins/vim-superman/bin

export PATH="$N_BIN_PATH:$N_NODE_BIN_PATH:$GEM_PATH:$GOPATH_BIN:$SNAP_PATH:$PRIVATE_BIN:$PRIVATE_CDG_BIN:$LOCAL_BIN:$RVN_BIN:$USER_BIN:$DEV_BIN:$YARN_BIN:$FZF_BIN:$NVIM:$SUPERMAN_PATH:$PATH"

# export TERM=xterm-256color

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

# Hehe, GG
gg() {
  env HUSKY_SKIP_HOOKS=1 git commit
}

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

# cdg (fzf bookmark cd via ~/.cdg_paths)
# https://dmitryfrank.com/articles/shell_shortcuts
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

# plugins
source /usr/share/doc/pkgfile/command-not-found.bash # suggests package providing command
source /etc/profile.d/autojump.bash # cd w/ history
source ~/.bash-powerline.sh # prompt
source <(kitty + complete setup bash)
source ~/code/vendor/node/util/npm-completion-fast/npm-completion-fast.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Via https://github.com/jez/vim-superman
complete -o default -o nospace -F _man vman

source ~/code/vendor/ui-apps/wakatime/bash-wakatime/bash-wakatime.sh
source ~/.node_bash_completion

# ssh-agent setup
if [ -f ~/.ssh/agent.env ] ; then
    . ~/.ssh/agent.env > /dev/null
    if ! kill -0 $SSH_AGENT_PID > /dev/null 2>&1; then
        echo "Stale agent file found. Spawning a new agent. "
        eval `ssh-agent | tee ~/.ssh/agent.env`
        ssh-add
    fi
else
    echo "Starting ssh-agent"
    eval `ssh-agent | tee ~/.ssh/agent.env`
    ssh-add
fi
