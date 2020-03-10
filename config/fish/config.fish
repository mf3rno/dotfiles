set -x EDITOR vim
set -x PATH ~/bin ~/.local/bin ~/.rvm/rubies/default/bin ~/bin/nvim/bin $PATH
set -x FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git --ignore node_modules --ignore bower_components --ignore dist --ignore build --ignore db -g ""'

alias vim='nvim'
alias cat='bat'

nvm use 13.1.0 --silent
# rvm use 2.7.0 --silent > /dev/null

# Metro prompt config
set -g theme_display_ruby no

