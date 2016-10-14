set shell=/bin/bash
call pathogen#infect()

" remap leader key
let mapleader = ","

set colorcolumn=80
set tw=80
syntax enable
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2

set background=dark
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

" Indentation differs by file type
autocmd FileType go setlocal noexpandtab " Only go uses spaces >:)

" Automatically reload changed (and unedited) files
set autoread

" Exec neocomplete
let g:neocomplete#enable_at_startup = 1

" Autocomplete with TAB
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" CtrlP settings
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore tmp --ignore dist --ignore .git --ignore cache --ignore node_modules --ignore bower_components --ignore vendor -g ""'

" CtrlP ctags with CTRL+SHIFT+P
nnoremap <silent> <leader>t :CtrlPTag<cr>

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Better grep (recursive, ignore common dirs)
:command! -nargs=+ Rjs grep -R --exclude-dir={node_modules,bower_components,vendor,tmp,dist,bin,build} --include=*.{js,json,es6,hbs} <args>
:command! -nargs=+ Rgo grep -R --exclude-dir={node_modules,bower_components,vendor,tmp,dist,bin,build} --include=*.go <args>
:command! -nargs=+ Rruby grep -R --exclude-dir={node_modules,bower_components,vendor,tmp,dist,bin,build} --include=*.{rb,yaml} <args>

" SyntaxComplete
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype * if &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
endif

" Auto-close scratch buffer
let g:scratch_autohide = 1

" close nerdtree if its the last window
" https://github.com/scrooloose/nerdtree/issues/21
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <silent> <leader>e :NERDTreeToggle<CR>

" Open NERDTree and jump to other buffer
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
