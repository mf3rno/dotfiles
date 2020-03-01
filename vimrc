set shell=/usr/bin/fish
call pathogen#infect()

" remap leader key
let mapleader = ","

" indent
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2

" colors
if (has("termguicolors"))
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set t_Co=256
set background=dark
syntax enable
" colorscheme night-owl
" colorscheme onehalfdark
" colorscheme spacecamp
" colorscheme tender
" colorscheme jellybeans
" colorscheme snazzy
colorscheme purify
" colorscheme palenight
" colorscheme dracula

filetype plugin on
filetype indent on

" basic etc
set hidden
set number
set showcmd
set cursorline
set splitbelow
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
set colorcolumn=80
set cmdheight=2
set updatetime=300
set signcolumn=yes
set shortmess+=c
set nocompatible
set sessionoptions-=blank

" Automatically reload changed (and unedited) files
set autoread

" CtrlP settings
" let g:ctrlp_switch_buffer = 0
" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_user_command = '/usr/bin/ag %s -l --nocolor --ignore tmp --ignore dist --ignore .git --ignore cache --ignore node_modules --ignore bower_components --ignore vendor -g ""'

" CtrlP ctags with CTRL+SHIFT+P
" nnoremap <silent> <leader>t :CtrlPTag<cr>

" fzf
set rtp+=/usr/bin/fzf

set noswapfile
set nobackup
set nowritebackup

" Better grep (recursive, ignore common dirs)
:command! -nargs=+ Rjs grep -R --exclude-dir={node_modules,bower_components,vendor,tmp,dist,bin,build} --include=*.{js,json,es6,hbs} <args>
:command! -nargs=+ Rgo grep -R --exclude-dir={node_modules,bower_components,vendor,tmp,dist,bin,build} --include=*.go <args>
:command! -nargs=+ Rruby grep -R --exclude-dir={node_modules,bower_components,vendor,tmp,dist,bin,build} --include=*.{rb,yaml} <args>
:command! -nargs=+ Rc grep -R --exclude-dir={node_modules,bower_components,vendor,tmp,dist,bin,build} --include=*.{c,h,cpp,cxx} <args>
:command! -nargs=+ Rany grep -R --exclude-dir={node_modules,bower_components,vendor,tmp,dist,bin,build} <args>

" SyntaxComplete
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype * if &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
endif

" Auto-close scratch buffer
" let g:scratch_autohide = 1

" close nerdtree if its the last window
" https://github.com/scrooloose/nerdtree/issues/21
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open NERDTree and jump to other buffer
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p

let g:NERDTreeWinSize = 45

" Auto-highlight colors
" autocmd bufenter * ColorHighlight
let g:colorizer_auto_filetype = 'css,scss,html'

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
endfunction

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{StatusDiagnostic()}
set statusline+=%*

let g:better_whitespace_enabled = 1
let g:echodoc#enable_at_startup = 1
let g:rainbow_active = 1
let g:vim_jsx_pretty_colorful_config = 1

let g:workspace_create_new_tabs = 0
let g:workspace_autosave_untrailspaces = 0
let g:workspace_autosave = 0

let g:airline_powerline_fonts = 1
let g:airline_theme='purify'
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z', 'error', 'warning']]
let g:airline#extensions#coc#enabled = 1
let g:airline_section_a=airline#section#create(['mode'])
let g:airline_section_z=airline#section#create_right(['%l/%L'])

let g:ale_fixers = { 'javascript': ['standard', 'eslint'] }

let g:jsdoc_allow_input_prompt=1
let g:jsdoc_return_description=1
let g:jsdoc_return_type=1
let g:jsdoc_underscore_private=1
let g:jsdoc_enable_es6=1

let g:test#vim#term_position = "belowright"
let g:test#strategy = 'neovim'

let g:fzf_command_prefix = 'FZF'

" https://github.com/janko/vim-test/issues/272#issuecomment-515749091
let g:root_markers = ['package.json', '.git/']
function! s:RunVimTest(cmd)
    for marker in g:root_markers
        let marker_file = findfile(marker, expand('%:p:h') . ';')
        if strlen(marker_file) > 0
            let g:test#project_root = fnamemodify(marker_file, ":p:h")
            break
        endif
        let marker_dir = finddir(marker, expand('%:p:h') . ';')
        if strlen(marker_dir) > 0
            let g:test#project_root = fnamemodify(marker_dir, ":p:h")
            break
        endif
    endfor

    execute a:cmd
endfunction

" coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" auto-calc import cost
augroup import_cost_auto_run
  autocmd!
  autocmd InsertLeave *.js,*.jsx,*.ts,*.tsx :ImportCost
  autocmd BufEnter *.js,*.jsx,*.ts,*.tsx :ImportCost
  autocmd CursorHold *.js,*.jsx,*.ts,*.tsx :ImportCost
augroup END

" keep selected text selected after indent change
vnoremap < <gv
vnoremap > >gv

if has('nvim')
  autocmd TermOpen term://* startinsert
endif

" navigating buffers
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
nnoremap <C-Q> :bd<CR>

nnoremap <leader>tf :call <SID>RunVimTest('TestFile')<cr>
nnoremap <leader>tn :call <SID>RunVimTest('TestNearest')<cr>
nnoremap <leader>ts :call <SID>RunVimTest('TestSuite')<cr>
nnoremap <leader>tl :call <SID>RunVimTest('TestLast')<cr>
nnoremap <leader>tv :call <SID>RunVimTest('TestVisit')<cr>
nnoremap <leader>aw :CocCommand cSpell.addWordToDictionary<cr>
nnoremap <silent> <leader>e :NERDTreeToggle<cr>
nnoremap <silent> <leader>g :Goyo<cr>
nnoremap <silent> <leader>zi :tab split<cr>
nnoremap <silent> <leader>zo :tab close<cr>
nnoremap <silent> <leader>t :split term:///usr/bin/fish<cr>
nnoremap <C-p> :FZF<cr>
nnoremap <leader>fzf :FZF<cr>
