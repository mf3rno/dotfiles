" {{{ 1. Custom cursor settings

" {{{ GUI

if has('gui_running')
  set guicursor=
  " set guicursor+=a:blinkwait300-blinkon500-blinkoff-100
  set guicursor+=n-v-c-sm:block
  set guicursor+=i-ci-ve:ver25
  set guicursor+=r-cr-o:hor20
  set guicursor+=a:blinkon0
endif

" }}}
" {{{ terminal

" {{{ reference

" t_SI: INSERT mode
" t_SR: REPLACE mode
" t_EI: NORMAL mode (ELSE)
"
" 1 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

" }}}

if !has('gui_running')
  let &t_SI = "\<Esc>[3 q"
  let &t_SR = "\<Esc>[5 q"
  let &t_EI = "\<Esc>[1 q"
endif

" }}}

" }}}
" {{{ 2. Plugins

" {{{

if has('nvim')
  call plug#begin('~/.nvim-plugins')
else
  call plug#begin('~/.vim-plugins')
end

" }}}
" {{{ script libraries

Plug 'google/vim-maktaba'
Plug 'xolox/vim-misc'
Plug 'godlygeek/tabular'

" }}}
" {{{ lightline

Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'sainnhe/lightline_foobar.vim'
Plug 'josa42/vim-lightline-coc'

" }}}
" {{{ fzf

Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'zackhsi/fzf-tags'

" }}}
" {{{ search/result highlighting

Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'timakro/vim-searchant'

" }}}
" {{{ syntax/languages

Plug 'dag/vim-fish'
Plug 'fatih/vim-go'
Plug 'vim-ruby/vim-ruby'
Plug 'mustache/vim-mustache-handlebars'
Plug 'hail2u/vim-css3-syntax'
Plug 'mboughaba/i3config.vim'
Plug 'smancill/conky-syntax.vim'
Plug 'sheerun/vim-yardoc'
Plug 'moll/vim-node'
Plug 'gisphm/vim-gitignore'
Plug 'andyk/vim-liquid'
Plug 'digitaltoad/vim-pug'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'vim-python/python-syntax'
Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'masukomi/vim-markdown-folding'

" {{{ typescript

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" }}}
" {{{ javascript

" Plug 'pangloss/vim-javascript'
Plug 'yuezk/vim-js'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'isRuslan/vim-es6'

" }}}

" }}}
" {{{ git integration

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/committia.vim' " better git commit layout
Plug 'int3/vim-extradite' " git log

" }}}
" {{{ visual

Plug 'jbgutierrez/vim-better-comments'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'Yggdroot/indentLine'
" Plug 'lukas-reineke/indent-blankline.nvim'

" }}}
" {{{ misc/general

Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'dense-analysis/ale'
Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-repeat' " . repeat for plugins
Plug 'mhinz/vim-startify'
Plug 'vimwiki/vimwiki'
Plug 'vim-scripts/ZoomWin'
Plug 'janko/vim-test'
Plug 'tpope/vim-unimpaired'
Plug 'markonm/traces.vim' " live search/sub preview
Plug 'schickling/vim-bufonly'
Plug 'tpope/vim-commentary' " fast commenting
Plug 'Raimondi/delimitMate' " quote/etc autocomplete
Plug 'AndrewRadev/dsf.vim' " delete surrounding function call
Plug 'Shougo/echodoc.vim'
Plug 'wincent/terminus' " enhanced terminal integration
Plug 'ternjs/tern_for_vim', { 'do': 'npm i' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'ludovicchabant/vim-gutentags' " auto tag regen
Plug 'michaeljsmith/vim-indent-object' " indent-level text object
Plug 'gcmt/wildfire.vim' " select text objects
Plug 'mtth/scratch.vim'
Plug 'rhysd/clever-split.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'yuttie/comfortable-motion.vim' " smooth scrolling
Plug 'unblevable/quick-scope' " f jump highlights
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch' " shell command helpers
Plug 'fcpg/vim-shore' " mv to 1st non-blank char w/ j/k
Plug 'AndrewRadev/bufferize.vim'
Plug 'danro/rename.vim'
Plug 'vim-scripts/DrawIt'
Plug 'thaerkh/vim-workspace'

if has('gui_running')
  Plug 'drmikehenry/vim-fontsize'
endif
" }}}
" {{{ colorschemes

" {{{ light

Plug 'reedes/vim-colors-pencil'
Plug 'mikker/lightline-theme-pencil'
Plug 'aonemd/kuroi.vim'
Plug 'swalladge/paper.vim'
Plug 'vim-scripts/summerfruit256.vim'
Plug 'habamax/vim-colors-defminus'
Plug 'notpratheek/vim-sol'
Plug 'kamwitsta/flatwhite-vim'
Plug 'vim-scripts/mayansmoke'
Plug 'yasukotelin/shirotelin'

" }}}
" {{{ dark

Plug 'ayu-theme/ayu-vim'
Plug 'toupeira/vim-desertink'
Plug 'fcpg/vim-farout'
Plug 'fcpg/vim-fahrenheit'
Plug 'bluz71/vim-moonfly-colors'
Plug 'romainl/Apprentice'
Plug 'AlessandroYorba/Alduin'
Plug 'djjcast/mirodark'
Plug 'ajmwagar/vim-deus'
Plug 'nanotech/jellybeans.vim'
Plug 'yuttie/hydrangea-vim'
Plug 'cocopon/iceberg.vim'
Plug 'itchyny/landscape.vim'
Plug 'sstallion/vim-wtf'
Plug 'sstallion/lightline-wtf'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'AlessandroYorba/Sierra'
Plug 'srcery-colors/srcery-vim'
Plug 'tpope/vim-vividchalk'
Plug 'jacoborus/tender.vim'
Plug 'artanikin/vim-synthwave84'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'DemonCloud/J'
Plug 'whatyouhide/vim-gotham'
Plug 'bignimbus/pop-punk.vim'
Plug 'franbach/miramare'
Plug 'trevordmiller/nova-vim'
Plug 'acepukas/vim-zenburn'
Plug 'arcticicestudio/nord-vim'
Plug 'atahabaki/archman-vim'
Plug 'levelone/tequila-sunrise.vim'
Plug 'ts-26a/vim-darkspace'

" }}}
" {{{ dual/multiple

Plug 'chriskempson/base16-vim'
Plug 'sainnhe/gruvbox-material'
Plug 'gruvbox-community/gruvbox'
Plug 'sonph/onehalf', { 'rtp': 'vim/' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-one'
Plug 'severij/vadelma'
Plug 'iKarith/tigrana'
Plug 'sainnhe/sonokai'
Plug 'mike-hearn/base16-vim-lightline'
Plug 'https://gitlab.com/protesilaos/tempus-themes-vim.git' " amazing
Plug 'junegunn/seoul256.vim'
Plug 'machakann/vim-colorscheme-tatami'
Plug 'noahfrederick/vim-hemisu'
Plug 'jan-warchol/selenized', { 'rtp': 'editors/vim' }
Plug 'andbar-ru/vim-unicon'
Plug 'wimstefan/vim-artesanal'

" }}}

" }}}
" {{{

call plug#end()

" }}}

" {{{ configuration

" {{{ ale

let g:ale_enabled = 1

let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'typescript': ['eslint'],
  \ 'ruby': ['rubocop'],
  \ 'pug': ['puglint'],
  \ }

let g:ale_fixers = {
  \ 'javascript': ['eslint'],
  \ 'ruby': ['rubocop'],
  \ }

let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_set_highlights = 1
let g:ale_set_signs = 1
let g:ale_sign_highlight_linenrs = 1
let g:ale_virtualtext_cursor = 1
let g:ale_open_list = 0

" }}}
" {{{ coc

" Taken from docs
"
" Map <tab> for trigger completion, completion confirm, snippet expand and jump
" like VSCode.

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

" Taken from docs, trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

let g:coc_node_path = '/home/f3rno/.nvm/versions/node/v14.2.0/bin/node'
let g:coc_node_args = ['--max-old-space-size=16384', '--no-warnings']

" }}}
" {{{ echodoc

let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'virtual'

" }}}
" {{{ fzf

set rtp+=/usr/bin/fzf

let g:fzf_command_prefix = 'FZF'
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

command! -bang -nargs=? -complete=dir FZFFilesWithNativePreview
    \ call fzf#vim#files(<q-args>, {
    \  'options': [
    \    '--reverse',
    \    '--info=inline',
    \    '--preview',
    \    '~/.vim/plugged/fzf.vim/bin/preview.sh {}'
    \  ]}, <bang>0)

" }}}
" {{{ gitgutter

let g:gitgutter_max_signs = 1000

" }}}
" {{{ goyo

let g:goyo_height = '80%'
let g:goyo_width = '60%'

function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set nonumber
  let b:coc_suggest_disable = 1 " popup 'invisible' but hides content
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set number
  let b:coc_suggest_disable = 0

  " Workaround for color scheme issue
  if has('nvim')
    silent! source $HOME/.config/nvim/init.vim
  else
    silent! source $HOME/.vimrc
  endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" }}}
" {{{ incsearch

let g:incsearch#auto_nohlsearch = 1 " disable hlsearch on cursor move

" query completion w/ buffer text
function! s:incsearch_keymap()
  IncSearchNoreMap <Tab> <Over>(buffer-complete)
  IncSearchNoreMap <S-Tab> <Over>(buffer-complete-prev)
endfunction

augroup incsearch-keymap
  autocmd!
  autocmd VimEnter * call s:incsearch_keymap()
augroup END

" }}}
" {{{ indentLine

let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" }}}
" {{{ javascript-libraries-syntax

let g:used_javascript_libs = 'underscore,react,chai'

" }}}
" {{{ lightline

" colorscheme defined in colorscheme config section

function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
  if exists('*FugitiveHead')
    let branch = FugitiveHead()
    return branch !=# '' ? ''.branch : ''
  endif
  return ''
endfunction

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:P')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

let g:lightline = {}
let g:lightline.active = {}
let g:lightline.active.left = [
  \ [ 'mode', 'paste', 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'],
  \ [ 'gitbranch', 'readonly', 'modified' ],
  \ [ 'filename', 'gutentagsstatus'],
  \ ]

let g:lightline.active.right = [
  \ [ 'percent', 'lineinfo' ],
  \ [ 'filetype' ],
  \ [ 'coc_status' ],
  \ ]

let g:lightline.component_function = {
  \ 'gitbranch': 'LightlineFugitive',
  \ 'readonly': 'LightlineReadonly',
  \ 'gutentagsstatus': 'gutentags#statusline',
  \ 'filename': 'LightlineFilename',
  \ }

let g:lightline.component_expand = {
  \ 'linter_checking': 'lightline#ale#checking',
  \ 'linter_infos': 'lightline#ale#infos',
  \ 'linter_warnings': 'lightline#ale#warnings',
  \ 'linter_errors': 'lightline#ale#errors',
  \ 'linter_ok': 'lightline#ale#ok',
  \
  \ 'coc_status': 'lightline#coc#status',
  \
  \ 'buffers': 'lightline#bufferline#buffers'
  \ }

let g:lightline.component_type = {
  \ 'linter_checking': 'right',
  \ 'linter_infos': 'right',
  \ 'linter_warnings': 'warning',
  \ 'linter_errors': 'error',
  \ 'linter_ok': 'right',
  \
  \ 'buffers': 'tabsel',
  \ }

let g:lightline.component_raw = { 'buffers': 1 }

let g:lightline.mode_map = {
  \ 'n' : 'N',
  \ 'i' : 'I',
  \ 'R' : 'R',
  \ 'v' : 'V',
  \ 'V' : 'V-L',
  \ "\<C-v>": 'V-B',
  \ 'c' : 'C',
  \ 's' : 'S',
  \ 'S' : 'S-L',
  \ "\<C-s>": 'S-B',
  \ 't': 'T',
  \ }

let g:lightline#ale#indicator_checking = "\uf110 "
let g:lightline#ale#indicator_infos = "\uf129 "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c "

let g:lightline.tabline = {
    \ 'left': [['buffers']],
    \ 'right': [],
    \ }

let g:lightline#bufferline#clickable = 1
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#show_number = 2 " ordinal
let g:lightline#bufferline#number_map = {
\ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
\ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'}

autocmd User CocStatusChange,CocDiagnosticChange,GutentagsUpdating,GutentagsUpdated call lightline#update()

" }}}
" {{{ python-syntax

let g:python_highlight_all = 1

" }}}
" {{{ rainbow_parentheses.vim

autocmd FileType javascript,json,typescript,ruby,python RainbowParentheses

" }}}
" {{{ startify

let g:startify_custom_header = [
      \ '        _________',
      \ '       / __/__  /_________  ____',
      \ '      / /_  /_ </ ___/ __ \/ __ \',
      \ '     / __/___/ / /  / / / / /_/ /',
      \ '    /_/  /____/_/  /_/ /_/\____/',
      \ ]

" }}}
" {{{ ultisnips

let g:UltiSnipsExpandTrigger = "<c-j>"
let g:ultisnips_javascript = { 'semi': 'never' }

" }}}
" {{{ vim-better-whitespace

let g:better_whitespace_enabled = 1

" }}}
" {{{ vim-better-comments

let g:bettercomments_language_aliases = { 'javascript': 'js' }

" }}}
" {{{ vim-colorscheme-switcher

let g:colorscheme_switcher_keep_background = 1
let g:colorscheme_switcher_exclude_builtins = 1
let g:colorscheme_switcher_define_mappings = 0
let g:colorscheme_switcher_exclude = ['tempus_autumn',
                                    \ 'tempus_dusk',
                                    \ 'tempus_night',
                                    \ 'tempus_rift',
                                    \ 'tempus_spring',
                                    \ 'tempus_summer',
                                    \ 'tempus_warp',
                                    \ 'tempus_winter',
                                    \ 'sol-term',
                                    \ 'base16-3024',
                                    \ 'base16-3024',
                                    \ 'base16-apathy',
                                    \ 'base16-ashes',
                                    \ 'base16-atelier-cave',
                                    \ 'base16-atelier-cave-light',
                                    \ 'base16-atelier-dune',
                                    \ 'base16-atelier-estuary',
                                    \ 'base16-atelier-estuary-light',
                                    \ 'base16-atelier-forest',
                                    \ 'base16-atelier-forest-light',
                                    \ 'base16-atelier-heath',
                                    \ 'base16-atelier-heath-light',
                                    \ 'base16-atelier-lakeside',
                                    \ 'base16-atelier-lakeside-light',
                                    \ 'base16-atelier-plateau',
                                    \ 'base16-atelier-plateau-light',
                                    \ 'base16-atelier-savanna',
                                    \ 'base16-atelier-savanna-light',
                                    \ 'base16-atelier-seaside',
                                    \ 'base16-atelier-seaside-light',
                                    \ 'base16-atelier-sulphurpool',
                                    \ 'base16-atelier-sulphur-light',
                                    \ 'base16-atlas',
                                    \ 'base16-bespin',
                                    \ 'base16-black-metal',
                                    \ 'base16-black-metal-bathory',
                                    \ 'base16-black-metal-burzum',
                                    \ 'base16-black-metal-dark-funeral',
                                    \ 'base16-black-metal-gorgoroth',
                                    \ 'base16-black-metal-immortal',
                                    \ 'base16-black-metal-khold',
                                    \ 'base16-black-metal-marduk',
                                    \ 'base16-black-metal-mayhem',
                                    \ 'base16-black-metal-nile',
                                    \ 'base16-black-metal-venom',
                                    \ 'base16-brewer',
                                    \ 'base16-bright',
                                    \ 'base16-brogrammer',
                                    \ 'base16-brushtrees',
                                    \ 'base16-brushtrees-dark',
                                    \ 'base16-chalk',
                                    \ 'base16-circus',
                                    \ 'base16-classic-dark',
                                    \ 'base16-classic-light',
                                    \ 'base16-codeschool',
                                    \ 'base16-cupcake',
                                    \ 'base16-darktooth',
                                    \ 'base16-default-dark',
                                    \ 'base16-default-light',
                                    \ 'base16-dracula',
                                    \ 'base16-eighties',
                                    \ 'base16-embers',
                                    \ 'base16-flat',
                                    \ 'base16-fruit-soda',
                                    \ 'base16-google-dark',
                                    \ 'base16-google-light',
                                    \ 'base16-grayscale-dark',
                                    \ 'base16-grayscale-light',
                                    \ 'base16-greenscreen',
                                    \ 'base16-gruvbox-dark-hard',
                                    \ 'base16-gruvbox-dark-medium',
                                    \ 'base16-gruvbox-dark-pale',
                                    \ 'base16-gruvbox-dark-soft',
                                    \ 'base16-gruvbox-light-soft',
                                    \ 'base16-harmonic-dark',
                                    \ 'base16-harmonic-light',
                                    \ 'base16-heetch',
                                    \ 'base16-heetch-light',
                                    \ 'base16-helios',
                                    \ 'base16-hopscotch',
                                    \ 'base16-horizon-dark',
                                    \ 'base16-ia-dark',
                                    \ 'base16-ia-light',
                                    \ 'base16-icy',
                                    \ 'base16-isotope',
                                    \ 'base16-macintosh',
                                    \ 'base16-marrakesh',
                                    \ 'base16-materia',
                                    \ 'base16-material-lighter',
                                    \ 'base16-material-palenight',
                                    \ 'base16-material-vivid',
                                    \ 'base16-mellow-purple',
                                    \ 'base16-mexico-light',
                                    \ 'base16-mocha',
                                    \ 'base16-monokai',
                                    \ 'base16-nord',
                                    \ 'base16-ocean',
                                    \ 'base16-oceanicnext',
                                    \ 'base16-onedark',
                                    \ 'base16-outrun-dark',
                                    \ 'base16-papercolor-dark',
                                    \ 'base16-papercolor-light',
                                    \ 'base16-paraiso',
                                    \ 'base16-phd',
                                    \ 'base16-pico',
                                    \ 'base16-pop',
                                    \ 'base16-porple',
                                    \ 'base16-railscasts',
                                    \ 'base16-rebecca',
                                    \ 'base16-shapeshifter',
                                    \ 'base16-solarized-dark',
                                    \ 'base16-spacemacs',
                                    \ 'base16-summerfruit-dark',
                                    \ 'base16-summerfruit-light',
                                    \ 'base16-tomorrow',
                                    \ 'base16-tube',
                                    \ 'base16-unikitty-dark',
                                    \ 'base16-unikitty-light',
                                    \ 'base16-xcode-dusk',
                                    \ 'base16-woodland',
                                    \ 'base16-zenburn',
                                  \ ]

" }}}
" {{{ vim-floaterm

hi Floaterm guibg=black
hi FloatermBorder guibg=green guifg=black

" }}}
" {{{ vim-grepper

let g:grepper = {}
let g:grepper.tools = ['ag']
let g:grepper.highlight = 1
let g:grepper.quickfix = 1
let g:grepper.open = 1
let g:grepper.switch = 1
let g:grepper.dir = 'repo,file'
let g:grepper.ag = {
  \ 'grepprg': 'ag --ignore-dir={modules,node_modules,.undodir,docs/dist,bower_components,dist,build}'
  \ }

" }}}
" {{{ vim-gutentags

let g:gutentags_ctags_exclude = ['coverage/*', 'node_modules/*', '*%*', 'docs/*']
let g:gutentags_enabled = 1

" }}}
" {{{ vim-highlightedyank

let g:highlightedyank_highlight_duration = 300

" }}}
" {{{ vim-javascript (replaced by vim-js)

" let g:javascript_plugin_jsdoc = 1
" let g:javascript_plugin_flow = 1

" }}}
" {{{ vim-jsx-pretty

let g:vim_jsx_pretty_colorful_config = 1

" }}}
" {{{ vim-markdown

let g:vim_markdown_folding_disabled = 1

" }}}
" {{{ vim-move

let g:move_key_modifier = 'C'

" }}}
" {{{ vim-perpetuloc

nnoremap <leader>[ :Lnext<cr>
nnoremap <leader>] :Lprevious<cr>

" }}}
" {{{ vim-ripgrep

let g:vim_search_pulse_mode = 'cursor_line'

" }}}
" {{{ vim-searchant

let g:searchant_all = 0 " only toggle current result highlight

" Disable Searchant highlight when incsearch.vim highlights also disable
autocmd CursorMoved * call SearchantStop()
function SearchantStop()
  :execute "normal \<Plug>SearchantStop"
endfunction

" }}}
" {{{ vim-test

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
" {{{ vim-workspace

let g:workspace_create_new_tabs = 0
let g:workspace_autosave_untrailspaces = 0
let g:workspace_autosave = 0

if has('nvim')
  let g:workspace_session_directory = $HOME . '/.config/nvim/sessions/'
else
  let g:workspace_session_directory = $HOME . '/.vim/sessions/'
endif

" }}}
" {{{ vimwiki

let g:vimwiki_folding = 'expr'
let g:vimwiki_global_ext = 0

" }}}

" }}}

" }}}
" {{{ 3. Base

" {{{ general

" Disable background erase for kitty
let &t_ut=''

syntax enable

filetype plugin on
filetype indent on

set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2

set timeout           " for mappings
set timeoutlen=300    " default value
set ttimeout          " for key codes
set ttimeoutlen=10    " unnoticeable small value

set shell=/bin/bash
set encoding=utf-8
set number
set splitbelow
set showmatch
" set incsearch " incsearch.vim used
set hlsearch
set colorcolumn=80
set cmdheight=2
set signcolumn=yes
set foldmethod=marker
set tags=./tags;,tags;$HOME;
set regexpengine=1
set backspace=indent,eol,start
set autoread
set noshowmode " lightline renders mode already
set showtabline=2
set shortmess-=S
set foldcolumn=2
set laststatus=2
set showcmd
set smartcase
set hidden
set tw=79 " word wrap
set nocompatible

set noswapfile
set nobackup
set nowritebackup

" }}}
" {{{ undo history

if has('persistent_undo')
  if has('nvim')
    let myUndoDir=$HOME . '/.config/nvim/undodir'
    execute 'silent !mkdir ' . myUndoDir . ' > /dev/null 2>&1'
    let &undodir=myUndoDir
  else
    let myUndoDir=$HOME . '/.vim/undodir'
    execute 'silent !mkdir ' . myUndoDir . ' > /dev/null 2>&1'
    let &undodir=myUndoDir
  endif

  set undofile
endif

" }}}
" {{{ autocommands

augroup editing
  au!
  au InsertLeave * set nopaste
  au BufEnter * set number
  au BufLeave * set nonumber
augroup END

" hacky fix for syntax highlighting in large files
autocmd WinEnter,Filetype * syntax sync fromstart

au BufNewFile,BufRead ~/.config/i3/config setf i3config

" disable cursorline in insert mode
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

" autosave
autocmd InsertLeave,TextChanged * update

" Fix for https://github.com/itchyny/lightline.vim/issues/448
" Called at end of vimrc
function! FixLightlineStartupRender(timer)
  execute('resize -1')
  execute('resize +1')
endfunction

autocmd VimEnter * call timer_start(600, 'FixLightlineStartupRender')

" }}}
" {{{ JS block comment indent fix

function! CustomJSIndentExpr()
  if getline(v:lnum) !~ '^\s*\*'
    " Do normal indent
    return GetJsxIndent()
  else
    " Don't indent comments
    return -1
  endif
endfunction

autocmd FileType javascript setlocal indentkeys+==* indentexpr=CustomJSIndentExpr()

" }}}

" }}}
" {{{ 4. Colorscheme

" {{{ reference

" {{{ dark

" jellybeans
" synthwave84
" dracula
" alduin
" desertink
" gotham
" miramare
" nova
" zenburn
" nord
" tequila-sunrise
" base16-seti
" tender
" selenized_bw
" sonokai

" }}}
" {{{ black

" base16-irblack
" moonfly
" archman
" vividchalk
" darkspace

" }}}
" {{{ dual

" hemisu
" gruvbox
" artesanal
" ayu
" gruvbox
" PaperColor

" }}}
" {{{ light

" sol
" mayansmoke
" flatwhite

" }}}

" }}}
" {{{ enable 256 colors

set t_Co=256

if (has("termguicolors"))
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" }}}
" {{{ configuration

" {{{ COLORSCHEME ayu

" let ayucolor='light'
" let ayucolor='mirage'
let ayucolor='dark'

" }}}
" {{{ COLORSCHEME gruvbox

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_improved_strings = 0
let g:gruvbox_improved_warnings = 0
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_underline = 1
let g:gruvbox_invert_selection = 0

" }}}
" {{{ COLORSCHEME gruvbox_material

let g:gruvbox_material_background = 'hard'

" }}}
" {{{ COLORSCHEME seoul256

" 233 (darkest) - 239 (lightest)
let g:seoul256_background = 234

" 252 (darkest) - 256 (lightest)
let g:seoul256_light_background = 252

" }}}
" {{{ COLORSCHEME solarized

let g:solarized_contrast = 'high'

" }}}
" {{{ COLORSCHEME sierra

let g:sierra_Twilight = 1

" }}}
" {{{ COLORSCHEME sonokai

" let g:sonokai_style = 'andromeda'
let g:sonokai_style = 'shusia'
" let g:sonokai_style = 'atlantis'
" let g:sonokai_style = 'maia'
let g:sonokai_enable_italic = 1

" }}}
" {{{ COLORSCHEME miramare

let g:miramare_enable_italic = 1

" }}}
" {{{ COLORSCHEME alduin

" Almost black bg
let g:alduin_Shout_Dragon_Aspect = 1

" Black bg
" let g:alduin_Shout_Become_Ethereal = 1

" Deep red for special highlighting groups
" let g:alduin_Shout_Fire_Breath = 1

" Remove block matchparens & add underline
" let g:alduin_Shout_Aura_Whisper = 1

" }}}
" {{{ COLORSCHEME one

let g:one_allow_italics = 1

" }}}
" {{{ COLORSCHEME sonokai

" shusia, andromeda, atlantis, maia
let g:sonokai_style = 'maia'
let g:sonokai_enable_italic = 1

" }}}
" {{{ COLORSCHEME srcery

let g:srcery_italic = 1

" }}}

" }}}

set background=light
colorscheme flatwhite

" }}}
" {{{ 5. GUI

" {{{ font & dynamic size

let g:default_fontsize = 10
let g:fontsize = g:default_fontsize

" let g:font = 'Iosevka'
" let g:font_features = ''

" let g:font = 'FuraCode Nerd Font'
" let g:font_features = 'cali'

" let g:font = 'Input Mono Normal'
" let g:font = 'Input Mono Narrow'
" let g:font = 'Input Mono Condensed'
" let g:font = 'Input Mono Compressed'
" let g:font_features = ''

let g:font = 'Hasklug Nerd Font Medium'
let g:font_features = ''

" let g:font = 'Rec Mono Linear'
" let g:font = 'Rec Mono Duotone'
" let g:font = 'Rec Mono SemiCasual'
" let g:font = 'Rec Mono Casual'
" let g:font_features = ''

" let g:font = 'Victor Mono'
" let g:font_features = ''

" let g:font = 'Operator Mono'
" let g:font_features = ''

" let g:font = 'Hermit'
" let g:font_features = ''

" let g:font = 'Source Code Pro'
" let g:font_features = ''

" let g:font = 'Hack'
" let g:font_features = ''

" let g:font = 'JetBrainsMono Nerd Font'
" let g:font_features = ''

" let g:font = 'BlexMono Nerd Font'
" let g:font_features = 'liga,  zero, frac'

function! SetFont()
  if exists('g:GtkGuiLoaded')
    call rpcnotify(1, 'Gui', 'Font', g:font . ' ' . g:fontsize)
    call rpcnotify(1, 'Gui', 'FontFeatures', g:font_features)
  elseif has('gui_running')
    exec "GuiFont " . g:font . ":h" . g:fontsize
  endif
endfunction

call SetFont()

function! AdjustFontSize(delta)
  let g:fontsize += a:delta
  call SetFont()
endfunction

function! ResetFontSize()
  let g:fontsize = g:default_fontsize
  call SetFont()
endfunction

nnoremap <C-=> :call AdjustFontSize(1)<CR>
nnoremap <C-+> :call AdjustFontSize(1)<CR>
nnoremap <C--> :call AdjustFontSize(-1)<CR>
nnoremap <C-0> :call ResetFontSize()<CR>

" }}}
" {{{ Neovim GTK settings

if has('nvim') && has('gui_running')
  " Paste via shift + insert
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>

  call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
  call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
  call rpcnotify(1, 'Gui', 'Option', 'Cmdline', 0)

  let g:GuiInternalClipoard = 1
endif

" }}}
" {{{ general settings

if has('gui_running')
  set guioptions-=T " remove toolbar
  set guioptions-=m " remove menu bar
  set guioptions-=e " use terminal tabline
  set guioptions-=r " remove right scrollbar
  set guioptions-=L " remove left scrollbar

  " Toggle menubar w/ CTRL+F1
  nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

  " Toggle fullscreen w/ F11
  map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

  " Paste via shift + insert
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif

" }}}

" }}}
" {{{ 6. netrw

let g:netrw_banner = 0
let g:netrw_altv = 1 " split to right
" let g:netrw_browse_split = 2 " open file in right split
let g:netrw_sizestyle = "H" " human readable base 1024
let g:netrw_liststyle = 3
let g:netrw_winsize = 20

" }}}
" {{{ 7. Search highlight toggle

" Removes the search highlight on insert mode and restores it in normal mode
function! s:toggle_highlight()
  if exists('b:last_hlsearch')
    let &l:hlsearch = b:last_hlsearch
    unlet b:last_hlsearch
  elseif &l:hlsearch
    let b:last_hlsearch = &l:hlsearch
    setlocal nohlsearch
  endif
endfunction

augroup vimrc_search
  autocmd!
  autocmd InsertEnter * call s:toggle_highlight()
  autocmd InsertLeave * call s:toggle_highlight()
augroup END

" }}}
" {{{ 8. Keybindings

let mapleader = ','

" {{{ fast line movements

nnoremap J 2j
nnoremap K 2k

" }}}
" {{{ ale

nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

" }}}
" {{{ buffer control

nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprev<CR>
nnoremap <silent> <leader>bo :BufOnly<cr>

" }}}
" {{{ ctrl+backspace delete word

noremap! <C-BS> <C-w>

" }}}
" {{{ coc

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" nnoremap <leader>j :call CocAction('diagnosticNext')<cr>
" nnoremap <leader>k :call CocAction('diagnosticPrevious')<cr>
nnoremap <leader>k :call CocAction('doHover')<cr>

" }}}
" {{{ easymotion

map in <Plug>(easymotion-next)
map iN <Plug>(easymotion-prev)

" }}}
" {{{ fast quit

nnoremap <silent> <leader>q :qa<cr>
nnoremap <silent> <leader>Q :q!<cr>

" }}}
" {{{ folds

nnoremap <expr> <leader>F &foldlevel ? 'zM' :'zR'
nnoremap <silent> <leader><Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

" }}}
" {{{ fzf

nnoremap <C-p> :FZFFilesWithNativePreview<cr>
nnoremap <leader>ZC :FZFCommands<cr>
nnoremap <leader>ZB :FZFBTags<cr>

" {{{ search open buffers
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>
" }}}
" {{{ search tags

function! s:tags_sink(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2:], '^.*\ze;"\t')
  execute 'silent e' parts[1][:-2]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction

function! s:tags()
  call fzf#run({
  \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
  \            '| grep -v -a ^!',
  \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
  \ 'down':    '40%',
  \ 'sink':    function('s:tags_sink')})
endfunction

command! Tags call s:tags()

" }}}

" }}}
" {{{ goto tag

nnoremap <leader>T :FZFTags<cr>

" }}}
" {{{ goyo

nnoremap <silent> <leader>g :Goyo<cr>

" }}}
" {{{ grepper

nnoremap <silent> <leader>G :Grepper<cr>
nnoremap <silent> <leader>W :Grepper-cword<cr>

" }}}
" {{{ incsearch

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map i/ <Plug>(incsearch-easymotion-/)
map i? <Plug>(incsearch-easymotion-?)
map ig/ <Plug>(incsearch-easymotion-stay)
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

" }}}
" {{{ netrw

nnoremap <leader>e :Lexplore<cr>

" }}}
" {{{ reload config

if has("nvim")
  nnoremap <silent> <leader>R :source ~/.config/nvim/init.vim<cr>
else
  nnoremap <silent> <leader>R :source ~/.vimrc<cr>
endif

" }}}
" {{{ splits

nnoremap <up> :resize -1<cr>
nnoremap <down> :resize +1<cr>
nnoremap <left> :vert resize +1<cr>
nnoremap <right> :vert resize -1<cr>

nnoremap <leader>s :CleverSplit<cr>

" }}}
" {{{ tab zoom+nav

nnoremap <silent> <leader>zi :tab split<cr>
nnoremap <silent> <leader>zo :tab close<cr>
nnoremap <silent> <leader>N :tabnext<cr>
nnoremap <silent> <leader>P :tabprev<cr>

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

" }}}
" {{{ trim trailing spaces

nnoremap <leader><leader><leader> :%s/\s\+$//e<cr>

" }}}

" }}}
