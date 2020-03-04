set -x EDITOR vim
set -x PATH $PATH ~/bin ~/.local/bin ~/.rvm/rubies/default/bin
set -x FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git --ignore node_modules --ignore bower_components --ignore dist --ignore build --ignore db -g ""'

alias vim='nvim'

# nvm use 12.16.1 --silent
# rvm use 2.7.0 --silent > /dev/null

