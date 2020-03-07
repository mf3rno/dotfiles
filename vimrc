" {{{ pathogen init

call pathogen#infect()

" }}}
" {{{ indent

set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2

" }}}
" {{{ colors & colorschemes
" {{{ 256 colors

set t_Co=256

if (has("termguicolors"))
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" }}}
" {{{ COLORSCHEME xcode

let g:xcodedarkhc_green_comments = 1
let g:xcodelighthc_green_comments = 1

" }}}
" {{{ COLORSCHEME gruvbox

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1

" }}}
" {{{ COLORSCHEME gruvbox_material

let g:gruvbox_material_background = 'hard'

" }}}
" {{{ COLORSCHEME one

let g:one_allow_italics = 1

" }}}
" {{{ COLORSCHEME solarized

let g:solarized_contrast = 'high'

" }}}
" {{{ COLORSCHEME two-firewatch

let g:two_firewatch_italics = 1

" }}}
" {{{ colorscheme

set background=dark
syntax enable
colorscheme gruvbox-material
" colorscheme Tomorrow-Night-Bright
" colorscheme NeoSolarized

" }}}
" }}}
" {{{ basic settings

let mapleader = ','

filetype plugin on
filetype indent on

set shell=/usr/bin/fish
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
set sessionoptions-=blank
set foldmethod=marker
" set foldlevelstart=1
set tags=./tags;,tags;$HOME;
set winblend=10
set regexpengine=1
set backspace=indent,eol,start
set autoread

let g:netrw_banner = 0

if has('nvim')
  autocmd TermOpen term://* startinsert
endif

" }}}
" {{{ backups

set noswapfile
set nobackup
set nowritebackup

" }}}
" {{{ plugins
" {{{ PLUGIN: ale

" disabled in leu of coc
let g:ale_enabled = 0

let g:ale_fixers = { 'javascript': ['standard', 'eslint'] }
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" }}}
" {{{ PLUGIN: any-jump



" }}}
" {{{ PLUGIN: bufexplorer



" }}}
" {{{ PLUGIN: coc

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

let g:coc_global_extensions = ['coc-solargraph']
let g:coc_snippet_next = '<tab>'

call coc#config('snippets', {
\   'extends': {
\     'cpp': ['c'],
\     'javascriptreact': ['javascript'],
\     'typescript': ['javascript']
\   },
\   'ultisnips': {
\     'directories': ['UltiSnips', 'gosnippets/UltiSnips']
\   }
\ })

" }}}
" {{{ PLUGIN: Colorizer

let g:colorizer_auto_filetype = 'css,scss,html'

" }}}
" {{{ PLUGIN: committia



" }}}
" {{{ PLUGIN: deliminate



" }}}
" {{{ PLUGIN: dsf



" }}}
" {{{ PLUGIN: echodoc

let g:echodoc#enable_at_startup = 1

" }}}
" {{{ PLUGIN: es.next.syntax


" }}}
" {{{ PLUGIN: firenvim


" }}}
" {{{ PLUGIN: fzf-tags


" }}}
" {{{ PLUGIN: fzf

set rtp+=/usr/bin/fzf

let g:fzf_command_prefix = 'FZF'
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'

" {{{ Files + devicons + floating fzf
function! FzfFilePreview()
  let l:fzf_files_options = '--preview "bat --theme=\"Monokai Extended\" --style=numbers,changes --color always {3..-1} | head -200" --expect=ctrl-v,ctrl-x'
  let s:files_status = {}

  function! s:cacheGitStatus()
    let l:gitcmd = 'git -c color.status=false -C ' . $PWD . ' status -s'
    let l:statusesStr = system(l:gitcmd)
    let l:statusesSplit = split(l:statusesStr, '\n')
    for l:statusLine in l:statusesSplit
      let l:fileStatus = split(l:statusLine, ' ')[0]
      let l:fileName = split(l:statusLine, ' ')[1]
      let s:files_status[l:fileName] = l:fileStatus
    endfor
  endfunction

  function! s:files()
    call s:cacheGitStatus()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_indicators(l:files)
  endfunction

  function! s:prepend_indicators(candidates)
    return s:prepend_git_status(s:prepend_icon(a:candidates))
  endfunction

  function! s:prepend_git_status(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:status = ''
      let l:icon = split(l:candidate, ' ')[0]
      let l:filePathWithIcon = split(l:candidate, ' ')[1]

      let l:pos = strridx(l:filePathWithIcon, ' ')
      let l:file_path = l:filePathWithIcon[pos+1:-1]
      if has_key(s:files_status, l:file_path)
        let l:status = s:files_status[l:file_path]
        call add(l:result, printf('%s %s %s', l:status, l:icon, l:file_path))
      else
        " printf statement contains a load-bearing unicode space
        " the file path is extracted from the list item using {3..-1},
        " this breaks if there is a different number of spaces, which
        " means if we add a space in the following printf it breaks.
        " using a unicode space preserves the spacing in the fzf list
        " without breaking the {3..-1} index
        call add(l:result, printf('%s %s %s', ' ', l:icon, l:file_path))
      endif
    endfor

    return l:result
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(lines)
    if len(a:lines) < 2 | return | endif

    let l:cmd = get({'ctrl-x': 'split',
                 \ 'ctrl-v': 'vertical split',
                 \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')

    for l:item in a:lines[1:]
      let l:pos = strridx(l:item, ' ')
      let l:file_path = l:item[pos+1:-1]
      execute 'silent '. l:cmd . ' ' . l:file_path
    endfor
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink*':   function('s:edit_file'),
        \ 'options': '-m --preview-window=right:70%:noborder --prompt Files\> ' . l:fzf_files_options,
        \ 'down':    '40%'})

endfunction
" }}}

" }}}
" {{{ PLUGIN: git-messenger

let g:git_messenger_into_popup_after_show = 0
let g:git_messenger_preview_mods = '"botleft"'

" }}}
" {{{ PLUGIN: golden-ratio

let g:golden_ratio_exclude_nonmodifiable = 1

" }}}
" {{{ PLUGIN: goyo

let g:goyo_height = '100%'

function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set nonumber
  call <SID>SwitchToLightColors()
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set scrolloff=5
  set number
  call <SID>SwitchToDarkColors()
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" }}}
" {{{ PLUGIN: gv


" }}}
" {{{ PLUGIN: incsearch-easymotion


" }}}
" {{{ PLUGIN: incsearch-fuzzy


" }}}
" {{{ PLUGIN: incsearch

let g:incsearch#auto_nohlsearch = 1

" }}}
" {{{ PLUGIN: javascript-libraries-syntax


" }}}
" {{{ PLUGIN: NERDTree

let g:NERDTreeWinSize = 45

" close nerdtree if its the last window
" https://github.com/scrooloose/nerdtree/issues/21
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open NERDTree and jump to other buffer
if !exists('g:started_by_firenvim')
  autocmd vimenter * NERDTree
  autocmd vimenter * wincmd p
else
  autocmd vimenter * NERDTreeToggle
endif

" }}}
" {{{ PLUGIN: node


" }}}
" {{{ PLUGIN: npm-package-info


" }}}
" {{{ PLUGIN: rainbow-parantheses

let g:rainbow_active = 1

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" }}}
" {{{ PLUGIN: ScrollColors


" }}}
" {{{ PLUGIN: SyntaxComplete

if has("autocmd") && exists("+omnifunc")
  autocmd Filetype * if &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
endif

" }}}
" {{{ PLUGIN: traces


" }}}
" {{{ PLUGIN: ultisnips

let g:UltiSnipsExpandTrigger = "<nop>"
let g:ultisnips_javascript = { 'semi': 'never' }

" }}}
" {{{ PLUGIN: vCooler


" }}}
" {{{ PLUGIN: vim-airline

let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox_material'
let g:airline#extensions#clock#auto = 0
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#grepper#enabled = 1
let g:airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'

function! AirlineInit()
  let g:airline_section_a=airline#section#create(['mode'])
  let g:airline_section_z=airline#section#create_right(['clock', '%l/%L'])
endfunction

autocmd User AirlineAfterInit call AirlineInit()

" }}}
" {{{ PLUGIN: vim-airline-clock


" }}}
" {{{ PLUGIN: vim-auto-save

let g:auto_save = 1
let g:auto_save_silent = 1

" }}}
" {{{ PLUGIN: vim-better-whitespace

let g:better_whitespace_enabled = 1

" }}}
" {{{ PLUGIN: vim-bufonly


" }}}
" {{{ PLUGIN: vim-buftabline


" }}}
" {{{ PLUGIN: vim-commentary


" }}}
" {{{ PLUGIN: vim-css3-syntax


" }}}
" {{{ PLUGIN: vim-current-word


" }}}
" {{{ PLUGIN: vim-devicons


" }}}
" {{{ PLUGIN: vim-easygrep


" }}}
" {{{ PLUGIN: vim-easymotion


" }}}
" {{{ PLUGIN: vim-extradite


" }}}
" {{{ PLUGIN: vim-fugitive


" }}}
" {{{ PLUGIN: vim-gitgutter


" }}}
" {{{ PLUGIN: vim-go


" }}}
" {{{ PLUGIN: vim-grepper

let g:grepper = {}
let g:grepper.tools = ['ag']
let g:grepper.highlight = 1
let g:grepper.quickfix = 0
let g:grepper.open = 1
let g:grepper.switch = 1
let g:grepper.dir = 'repo,file'
let g:grepper.ag = {
  \ 'grepprg': 'ag --ignore-dir=node_modules --ignore-dir=bower_components --ignore-dir=dist --ignore-dir=build'
  \ }

" }}}
" {{{ PLUGIN: vim-gutentags

" defined in ~/.ctags instead
let g:gutentags_ctags_exclude = ['coverage/*', 'node_modules/*']
let g:gutentags_enabled = 1
" let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')

" }}}
" {{{ PLUGIN: vim-indentguides


" }}}
" {{{ PLUGIN: vim-jsdoc

let g:jsdoc_allow_input_prompt=1
let g:jsdoc_return_description=1
let g:jsdoc_return_type=1
let g:jsdoc_underscore_private=1
let g:jsdoc_enable_es6=1

" }}}
" {{{ PLUGIN: vim-js-file-import


" }}}
" {{{ PLUGIN: vim-jsx-pretty

let g:vim_jsx_pretty_colorful_config = 1

" }}}
" {{{ PLUGIN: vim-maktaba


" }}}
" {{{ PLUGIN: vim-markdown


" }}}
" {{{ PLUGIN: vim-mustache-handlebars


" }}}
" {{{ PLUGIN: vim-nerdtree-syntax-higlight


" }}}
" {{{ PLUGIN: vim-repeat


" }}}
" {{{ PLUGIN: vim-ripgrep

let g:vim_search_pulse_mode = 'cursor_line'

" }}}
" {{{ PLUGIN: vim-ruby


" }}}
" {{{ PLUGIN: vim-search-pulse


" }}}
" {{{ PLUGIN: vim-snippets


" }}}
" {{{ PLUGIN: vim-startify


" }}}
" {{{ PLUGIN: vim-test

let g:test#vim#term_position = "belowright"
let g:test#strategy = 'neovim'

" function! MochaDebugTransform(cmd) abort
"   return 'env DEBUG="*" '.a:cmd
" endfunction

" let g:test#custom_transformations = {'mocha': function('MochaDebugTransform')}
" let g:test#transformation = 'mocha'

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

" }}}
" {{{ PLUGIN: vim-togglebg


" }}}
" {{{ PLUGIN: vim-which-key

let g:which_key_use_floating_win = 0

nnoremap <silent> <leader> :<c-u>WhichKey ','<CR>

" }}}
" {{{ PLUGIN: vimwiki

let g:vimwiki_folding = 'list'

" }}}
" {{{ PLUGIN: vim-workspace

let g:workspace_create_new_tabs = 0
let g:workspace_autosave_untrailspaces = 0
let g:workspace_autosave = 0

" }}}
" {{{ PLUGIN: vim-yardoc


" }}}
" {{{ PLUGIN: yajs


" }}}
" {{{ PLUGIN: ZoomWin


" }}}
" }}}
" {{{ color switching
function! s:SwitchToLightColors()
  set background=light
  colorscheme gruvbox-material
  exec "AirlineTheme gruvbox_material"
  exec "AirlineRefresh"
endfunction

function! s:SwitchToDarkColors()
  set background=dark
  colorscheme gruvbox-material
  exec "AirlineTheme gruvbox_material"
  exec "AirlineRefresh"
endfunction
" }}}
" {{{ keybindings

" {{{ vim-which-key start

" dictionary
let g:which_key_map =  {}

" }}}

" {{{ buffer control

" navigation
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
nnoremap <C-Q> :bd<CR>

" cleanup
nnoremap <silent> <leader>bo :BufOnly<cr>

let g:which_key_map.b = { 'name': '+buffer control' }
let g:which_key_map.b.o = ['Bufonly', 'close other buffers']

" }}}
" {{{ coc

let g:which_key_map.c = { 'name': '+coc' }

nnoremap <leader>cdw :CocCommand cSpell.addWordToDictionary<cr>
nnoremap <leader>cf :CocCommand eslint.executeAutoFix<cr>

let g:which_key_map.c.dw = ['CocCommand cSpell.addWordToDictionary<cr>', 'add word to dict']
let g:which_key_map.c.f = ['CocCommand eslint.executeAutoFix<cr>', 'exec auto-fix']

" Use <c-space> to trigger completion.
inoremap <silent> <c-space> :call coc#refresh()

" {{{ show docs
function! s:coc_show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent> K :call <SID>coc_show_documentation()<CR>
" }}}

" }}}
" {{{ coc goto

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" }}}
" {{{ ctrl+backspace delete word

noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" }}}
" {{{ easymotion

map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

" }}}
" {{{ extradite

nnoremap <silent> <leader>L :Extradite<cr>

" }}}
" {{{ fast quit

nnoremap <silent> <leader>q :qa<cr>
nnoremap <silent> <leader>Q :q!<cr>

" }}}
" {{{ folds

nnoremap <expr> <leader>F &foldlevel ? 'zM' :'zR'
let g:which_key_map.F = ['&foldlevel ? "zM" : "zR"', 'toggle fold level']

nnoremap <silent> <leader><Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

" }}}
" {{{ fzf

nnoremap <C-p> :call FzfFilePreview()<cr>

" }}}
" {{{ goto tag

nnoremap <leader>T <Plug>(fzf_tags)
let g:which_key_map.T = ['<Plug>(fzf_tags)', 'goto tag']

" }}}
" {{{ goyo

nnoremap <silent> <leader>g :Goyo<cr>
let g:which_key_map.g = ['Goyo', 'toggle goyo']

" }}}
" {{{ gv

nnoremap <leader>gv :GV<cr>
nnoremap <leader>gv! :GV!<cr>
nnoremap <leader>gv? :GV?<cr>

" }}}
" {{{ grepper

nnoremap <silent> <leader>G :Grepper<cr>
let g:which_key_map.G = ['Grepper', 'do grep']

" }}}
" {{{ incsearch

" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)
map / <Plug>(incsearch-easymotion-/)
map ? <Plug>(incsearch-easymotion-?)
map g/ <Plug>(incsearch-easymotion-stay)
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

" }}}
" {{{ NERDTree

nnoremap <silent> <leader>e :NERDTreeToggle<cr>
let g:which_key_map.e = ['NERDTreeToggle', 'toggle NERDTree']

" }}}
" {{{ npm package info

nnoremap <silent> <leader>N :PackageInfo<cr>
let g:which_key_map.N = ['PackageInfo', 'show info for package']

" }}}
" {{{ tab zoom

nnoremap <silent> <leader>zi :tab split<cr>
nnoremap <silent> <leader>zo :tab close<cr>

" }}}
" {{{ terminal splits

command! -nargs=* T split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>

" }}}
" {{{ testing

nnoremap <leader>tf :call <SID>RunVimTest('TestFile')<cr>
nnoremap <leader>tn :call <SID>RunVimTest('TestNearest')<cr>
nnoremap <leader>ts :call <SID>RunVimTest('TestSuite')<cr>
nnoremap <leader>tl :call <SID>RunVimTest('TestLast')<cr>
" nnoremap <leader>tv :call <SID>RunVimTest('TestVisit')<cr>

let g:which_key_map.t = { 'name': '+testing' }
let g:which_key_map.t.f = ["<SID>RunVimTest('TestFile')<cr>", 'test file']
let g:which_key_map.t.n = ["<SID>RunVimTest('TestNearest')<cr>", 'test nearest']
let g:which_key_map.t.s = ["<SID>RunVimTest('TestSuite')<cr>", 'test suite']
let g:which_key_map.t.l = ["<SID>RunVimTest('TestLast')<cr>", 'test last']

" }}}
" {{{ Colors

nnoremap <leader>Cl :call <SID>SwitchToLightColors()<cr>
nnoremap <leader>Cd :call <SID>SwitchToDarkColors()<cr>

let g:which_key_map.C = { 'name': '+colors' }
let g:which_key_map.C.l = ['call <SID>SwitchToLightColors()', 'light bg']
let g:which_key_map.C.d = ['call <SID>SwitchToDarkColors()', 'dark bg']

" call togglebg#map("<F5>")

" }}}
" {{{ vimrc

nnoremap <silent> <leader>R :source ~/.vimrc<cr>
let g:which_key_map.R = ['source ~/.vimrc', 'reload vimrc']

" }}}

" {{{ vim-which-key end

" register dictionary
call which_key#register(',', "g:which_key_map")

" }}}

" }}}
" {{{ statusline
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
set statusline+=%{StatusDiagnostic()}
set statusline+=%{gutentags#statusline()}
set statusline+=%*
" }}}
