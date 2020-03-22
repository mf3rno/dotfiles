set -x EDITOR vim
set -x PATH ~/code/terminals/alacritty/target/release ~/go/bin /snap/bin ~/bin ~/bin/bfx-hf-ui ~/.local/bin ~/.rvm/rubies/default/bin ~/bin/nvim/bin /usr/local/bin $PATH
set -x FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git --ignore node_modules --ignore bower_components --ignore dist --ignore build --ignore db -g ""'
set -x TERM 'xterm-256color'

set -g pure_symbol_prompt " >"

alias cat="bat"
alias vim="nvim"
alias ls="colorls"

# nvm use 13.1.0 --silent
# rvm use 2.7.0 --silent > /dev/null

zoxide init fish | source
