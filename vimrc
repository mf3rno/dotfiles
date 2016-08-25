set shell=/bin/bash

call pathogen#infect()

set colorcolumn=80
syntax enable
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2

colorscheme Tomorrow-Night-Eighties

set number
set showcmd
set cursorline

filetype indent on

set wildmenu
set lazyredraw
set showmatch

set incsearch
set hlsearch

" CtrlP settings
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

autocmd vimenter * NERDTree
