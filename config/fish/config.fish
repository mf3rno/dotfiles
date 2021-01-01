set -x EDITOR vim
set -x GEM_HOME ~/.rvm/gems/ruby-2.7.0
set -x GEM_PATH $GEM_HOME /.rvm/gems/ruby-2.7.0@global/bin
set -x GOPATH ~/go
set -x PATH ~/go/bin /snap/bin ~/bin ~/bin/bfx-hf-ui ~/.local/bin ~/.rvm/rubies/default/bin ~/.rvm/gems/default/bin ~/.rvm/bin ~/bin/nvim/bin /usr/local/bin $PATH
set -x FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git --ignore node_modules --ignore bower_components --ignore dist --ignore build --ignore db -g ""'
set -x TERM 'xterm-256color'

set -g pure_symbol_prompt " >"

alias ls="lsd"
alias cat="bat"

# nvm use 13.11.0

# zoxide init fish | source
