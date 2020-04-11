# If not running interactively, don't do anything
if [[ $- != *i* ]]; then return; fi


export EDITOR=vim
export SHELL=bash
export GEM_HOME=~/.rvm/gem/ruby-2.7.0
export GEM_PATH=~/.rvm/gems/ruby-2.7.0/bin
export NVM_DIR=~/.nvm
export GOPATH=~/go
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore .undodir --ignore docs --ignore node_modules --ignore bower_components --ignore dist --ignore build -g ""'

export PATH="$GEM_PATH:$GOPATH/bin:/snap/bin:~/bin:~/bin/bfx-hf-ui:~/.local/bin:~/.rvm/bin:/usr/local/bin:~/bin/dev-sessions:$PATH"

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

# convenience
# lsd disabled due to poor visiblity on white bg, no color scheme support
# alias ls="lsd"
# alias ll="lsd -lh"
# alias lah="lsd -lah"
alias ls="ls --color=auto"
alias ll='ls -lah --color=auto'
alias grep='grep --color'
alias cat="bat"

# load nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

set -o noclobber # prevent redirect overwriting existing files
shopt -s autocd # cd by entering path with no prefix

# plugins
source /usr/share/doc/pkgfile/command-not-found.bash # suggests package providing command
source /etc/profile.d/autojump.bash # cd w/ history
source ~/.bash-powerline.sh # prompt
source <(kitty + complete setup bash)

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
