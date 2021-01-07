" {{{ 1. terminal setup

" {{{ reference

" t_SI: INSERT mode
" t_SR: REPLACE mode
" t_EI: NORMAL mode (ELSE)
"
" 1 blinking block
" 2 solid block
" 3 blinking underscore
" 4 solid underscore
" 5 blinking vertical bar
" 6 solid vertical bar

" }}}

" TODO: Break out strings as constants
if !has('gui_running')
  let &t_SI = "\<Esc>[3 q"
  let &t_SR = "\<Esc>[5 q"
  let &t_EI = "\<Esc>[1 q"
endif

" }}}
" {{{ 2. plugins

" {{{ loading

" {{{

if has('nvim')
  let g:xf3rno_plugin_root = '/.nvim-plugins'
else
  let g:xf3rno_plugin_root = '/.vim-plugins'
end

let g:xf3rno_plugin_path = $HOME . g:xf3rno_plugin_root

call plug#begin(g:xf3rno_plugin_path)

" }}}
" {{{ script libraries

Plug 'google/vim-maktaba'
Plug 'xolox/vim-misc'
Plug 'godlygeek/tabular'

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
" {{{ snipppets

Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'justinj/vim-react-snippets'
" Plug 'zirho/vim-agnostic-react-snippets'

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
Plug 'udalov/kotlin-vim'

" {{{ pandoc

" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'

" }}}
" {{{ markdown

Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown'
" Plug 'mmai/vim-markdown-wiki'
" Plug 'rhysd/vim-gfm-syntax'
Plug 'sidofc/mkdx'
Plug 'mzlogin/vim-markdown-toc'
Plug 'dhruvasagar/vim-table-mode'

" }}}
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
Plug 'isRuslan/vim-es6', { 'do': 'rm -rf ./snippets ./UltiSnips' }
Plug 'elzr/vim-json'
Plug 'kristijanhusak/vim-js-file-import', { 'do': 'npm install' }

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
" Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'Yggdroot/indentLine'
" Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'majutsushi/tagbar'

" }}}
" {{{ testing

Plug 'janko/vim-test'
Plug 'google/vroom'

" }}}
" {{{ misc/general

Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'dense-analysis/ale'
Plug 'jlanzarotta/bufexplorer'
Plug 'vim-scripts/ZoomWin'
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
" Plug 'ludovicchabant/vim-gutentags' " auto tag regen
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
Plug 'Lenovsky/nuake'
Plug 'tpope/vim-surround'
Plug 'tyru/open-browser.vim'
Plug 'tpope/vim-endwise'
Plug 'danilamihailov/vim-tips-wiki'
Plug 'wellle/visual-split.vim'
Plug 'wellle/targets.vim'
Plug 'valloric/MatchTagAlways'
Plug 'wakatime/vim-wakatime'
" Plug 'raghur/vim-ghost', { 'do': ':GhostInstall' }

" requires set compatible
" Plug 'tpope/vim-sleuth' " auto indent adjustment

" if has('nvim')
"   Plug 'ripxorip/aerojump.nvim', { 'do': ':UpdateRemotePlugins' }
" endif

if has('gui_running') || exists('g:GtkGuiLoaded')
  Plug 'drmikehenry/vim-fontsize'
endif

" }}}
" {{{ wiki

" Plug 'vim-scripts/AnsiEsc.vim'
Plug 'powerman/vim-plugin-AnsiEsc', { 'on': 'AnsiEsc' }

" xarthurx is a maintained fork
" Plug 'blindFS/vim-taskwarrior'
" Plug 'xarthurx/taskwarrior.vim', { 'on': 'TW' }
Plug 'rbgrouleff/bclose.vim'
Plug 'mattn/calendar-vim'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'f3rno/vimwiki-footnotes'
" Plug 'tbabej/taskwiki'

" Plug 'LarsEKrueger/pandoc-vimwiki'
" Plug 'michal-h21/vim-zettel'
" Plug 'linuxcaffe/taskwiki-two'

" }}}
" {{{ colorschemes

" {{{ light

Plug 'reedes/vim-colors-pencil'
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
Plug 'evturn/vim-hardaway'
Plug 'ksevelyar/joker.vim'
Plug 'tomasr/molokai'
Plug 'hardcoreplayers/oceanic-material'
Plug 'shannonmoeller/vim-monokai256'
Plug 'vim-scripts/vibrantink'

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
Plug 'https://gitlab.com/protesilaos/tempus-themes-vim.git' " amazing
Plug 'junegunn/seoul256.vim'
Plug 'machakann/vim-colorscheme-tatami'
Plug 'noahfrederick/vim-hemisu'
Plug 'jan-warchol/selenized', { 'rtp': 'editors/vim' }
Plug 'andbar-ru/vim-unicon'
Plug 'wimstefan/vim-artesanal'
Plug 'overcache/NeoSolarized'

" }}}

" }}}
" {{{

call plug#end()

" }}}

" }}}
" {{{ configuration

" {{{ ale

let g:ale#enabled = 1

let g:ale#linters = {
\ 'javascript': ['eslint'],
\ 'typescript': ['eslint'],
\ 'json': ['eslint'],
\ 'ruby': ['rubocop'],
\ 'pug': ['puglint'],
\ 'scss': ['stylelint'],
\ 'css': ['stylelint'],
\ 'vim': ['vint'],
\ }

let g:ale#fixers = {
\ 'javascript': ['eslint'],
\ 'json': ['fixjson'],
\ 'ruby': ['rubocop'],
\ 'scss': ['stylelint'],
\ 'css': ['stylelint'],
\ 'vim': ['vint'],
\ }

let g:ale#lint#on#insert#leave = 1
let g:ale#lint#on#enter = 1
let g:ale#lint#on#save = 1
let g:ale#set#loclist = 1
let g:ale#set#quickfix = 0
let g:ale#set#highlights = 1
let g:ale#set#signs = 1
let g:ale#sign#highlight#linenrs = 1
let g:ale#virtualtext#cursor = 1
let g:ale#open#list = 0

" }}}
" {{{ coc/ultisnips integration (coc as the driver, ultisnips for expansion)

let g:coc#snippet#next = '<c-j>'
let g:coc#snippet#prev = '<c-k>'

let g:coc#node#path = '/home/xf3rno/.nvm/versions/node/v15.4.0/bin/node'
let g:coc#node#args = ['--max-old-space-size=16384', '--no-warnings']

func! s:xf3rno_coc_tab_handler() abort
  if pumvisible()
    call coc#_select_confirm()
  elseif coc#expandableOrJumpable()
    call coc#rpc#request('doKeymap', ['snippets-expand-jump',''])
  elseif <SID>xf3rno_util_used_backspace()
    return "\<TAB>"
  endif

  call coc#refresh()
endfunc

func! s:xf3rno_util_used_backspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunc

inoremap <silent><expr> <tab> <SID>xf3rno_coc_tab_handler()

" {{{   - s:xf3rno_ultisnips_log

let g:xf3rno#ulitisnips#log = maktaba#log#Logger('ultisnips')

" {{{     - s:xf3rno_ultisnips_log_debug(...)

func! s:xf3rno_ultisnips_log_debug(...) abort
  call g:xf3rno#ultisnips#log.LogDebug(a:000)
endfunc

" }}}
" {{{     - s:xf3rno_ultisnips_log_info(...)

func! s:xf3rno_ultisnips_log_info(...) abort
  call g:xf3rno#ultisnips#log.LogInfo(a:000)
endfunc

" }}}
" {{{     - s:xf3rno_ultisnips_log_warn(...)

func! s:xf3rno_ultisnips_log_warn(...) abort
  call g:xf3rno#ultisnips#log.LogWarn(a:000)
endfunc

" }}}
" {{{     - s:xf3rno_ultisnips_log_error(...)

func! s:xf3rno_ultisnips_log_error(message, ...) abort
  call g:xf3rno#ultisnips#log.LogError(a:000)
endfunc

" }}}
" {{{     - s:xf3rno_ultisnips_log_severe(...)

func! s:xf3rno_ultisnips_log_severe(...) abort
  call g:xf3rno#ultisnips#log.LogSevere(a:000)
endfunc

" }}}

" }}}

autocmd BufNewFile .gitignore CocCommand template.templateTop

" }}}
" {{{ echodoc

let g:echodoc#enable#at#startup = 1
let g:echodoc#type = 'virtual'

" }}}
" {{{ fzf

set rtp+=/usr/bin/fzf
set rtp+=/home/xf3rno/.cargo/bin

let g:fzf#command#prefix = 'FZF'
let g:fzf#buffers#jump = 1
let g:fzf#tags#command = 'ctags -R'
let g:fzf#layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" TODO: Check for/extract fzf.vim path
" TOOD: Explode final preview script path
func! s:xf3rno_fzf_find_files() abort
  let s:preview_path = g:xf3rno_plugin_path . '/fzf.vim/bin/preview.sh {}'

  exec fzf#run(({
      \   'options': [
      \     '--reverse',
      \     '--info=inline',
      \     '--preview',
      \     s:preview_path
      \   ],
      \ }))
endfunc

" }}}
" {{{ gitgutter

let g:gitgutter#max#signs = 1000

" }}}
" {{{ goyo

let g:goyo#height = '80%'
let g:goyo#width = '60%'

func! s:goyo_enter()
set noshowmode
set noshowcmd
set nonumber
let b:coc_suggest_disable = 1 " popup 'invisible' but hides content
endfunc

func! s:goyo_leave()
set showmode
set showcmd
set number
let b:coc_suggest_disable = 0

" Workaround for color scheme issue
" TODO: Update w/ dynamic config path
if has('nvim')
silent! source $HOME/.config/nvim/init.vim
else
silent! source $HOME/.vimrc
endif
endfunc

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" }}}
" {{{ incsearch

let g:incsearch#auto#nohlsearch = 1 " disable hlsearch on cursor move

" query completion w/ buffer text
func! s:incsearch_keymap()
IncSearchNoreMap <Tab> <Over>(buffer-complete)
IncSearchNoreMap <S-Tab> <Over>(buffer-complete-prev)
endfunc

augroup incsearch-keymap
autocmd!
autocmd VimEnter * call <SID>incsearch_keymap()
augroup END

" }}}
" {{{ indentLine

let g:indentLine#char#list = ['|', '¦', '┆', '┊']

" }}}
" {{{ javascript-libraries-syntax

let g:used#javascript#libs = 'underscore,react,chai'

" }}}
" {{{ MatchTagAlways

let g:mta#filetypes = {
\ 'html' : 1,
\ 'xml' : 1,
\ 'jinja.html' : 1,
\}

" }}}
" {{{ mkdx

let g:mkdx#settings = {
\   'map': {
\     'enable': 0
\   },
\
\   'checkbox': {
\     'toggles': [' ', '.', 'x']
\   },
\
\   'highlight': {
\      'enable': 1
\   },
\ }

" }}}
" {{{ nuake

let g:nuake#start#insert = 0
let g:nuake#position = 'bottom'
let g:nuake#size = 0.4

" }}}
" Pandoc {{{

let g:pandoc#folding#mode = 'syntax'
let g:pandoc#filetypes#handled = ["pandoc", "markdown", "rst"]
let g:pandoc#modules#enabled = ["formatting", "folding", "toc", "command", "menu", "bibliographies", "completion"]
let g:pandoc#folding#fold#yaml=1
let g:pandoc#syntax#conceal#urls=1
let g:pandoc#folding#fold#fenced#codeblocks = 1
" let g:pandoc_syntax_codeblocks_embeds_langs = ["python"]
" let g:pandoc_biblio_bibs = ["/home/alasdair/zettel/zettel.bib"]

" }}}
" {{{ python-syntax

let g:python#highlight#all = 1

" }}}
" {{{ startify

let g:startify#custom#header = [
\ '        _________',
\ '       / __/__  /_________  ____',
\ '      / /_  /_ </ ___/ __ \/ __ \',
\ '     / __/___/ / /  / / / / /_/ /',
\ '    /_/  /____/_/  /_/ /_/\____/',
\ ]

" }}}
" {{{ ultisnips

autocmd FileType js,javascript UltiSnipsAddFiletypes javascript-jsdoc

let g:UltiSnipsEnableSnipMate = 0
let g:UltiSnipsExpandTrigger = '<c-space>'
let g:UltiSnipsListSnippets = '<c-space><c-space>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
let g:UltiSnipsSnippetDirectories = [
      \   '/home/xf3rno/.src/github/xf3rno/vim-snippets/ultisnips',
      \ ]

" {{{

" let g:ultisnips_javascript = {
"       'keyword-spacing': 'always',
"       'semi': 'never',
"       'space-before-function-paren': 'always',
"       }

" }}}
" {{{ vim-better-whitespace

let g:better#whitespace#enabled = 1

" }}}
" {{{ vim-better-comments

let g:bettercomments#included = ['javascript', 'js', 'go', 'ruby', 'python']

" }}}
" {{{ vim-diminactive

let g:diminactive#use#colorcolumn = 1
let g:diminactive#use#syntax = 1
let g:diminactive#enable#focus = 1

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

let g:gutentags#ctags#exclude = ['coverage/*', 'node_modules/*', '*%*', 'docs/*']
let g:gutentags#enabled = 1

" }}}
" {{{ vim-highlightedyank

let g:highlightedyank#highlight#duration = 300

" }}}
" {{{ vim-instant-markdown

let g:instant#markdown#autostart = 0

" }}}
" {{{ vim-javascript (replaced by vim-js)

" let g:javascript_plugin_jsdoc = 1
" let g:javascript_plugin_flow = 1

" }}}
" {{{ vim-js-file-import

let g:js_file#import#sort#after#insert = 1
let g:js_file_import#prompt#if#no#tag = 0
let g:js#file#import#omit#semicolon = 1
let g:js#file#import#use#fzf = 1
let g:js#file#import#no#mappings = 1

" }}}
" {{{ vim-jsx-pretty

let g:vim#jsx#pretty#colorful#config = 1

" }}}
" {{{ vim-markdown

let g:vim#markdown#folding#disabled = 1
let g:vim#markdown#folding#style#pythonic = 1
let g:vim#markdown#folding#level = 2
let g:vim#markdown#toc#autofit = 1
let g:vim#markdown#frontmatter = 1
let g:vim#markdown#json#frontmatter = 1
let g:vim#markdown#strikethrough = 1
let g:vim_markdown#new#list#item#indent = 2
let g:vim_markdown#no#extensions#in#markdown = 1
let g:vim#markdown#edit#url#in = 'current' " 'vsplit'
let g:vim#markdown#autowrite = 1

" }}}
" {{{ vim-markdown-toc

let g:vmt#auto#update#on#save = 1
let g:vmt#dont#insert#fence = 0
let g:vmt#fence#hidden#markdown#style = 'GFM'
let g:vmt#cycle#list#item#markers = 0
let g:vmt#list#item#char = '-'
let g:vmt#include#headings#before = 1

" }}}
" {{{ vim-move

let g:move#key#modifier = 'C'

" }}}
" {{{ vim-perpetuloc

nnoremap <leader>[ :Lnext<cr>
nnoremap <leader>] :Lprevious<cr>

" }}}
" {{{ vim-ripgrep

let g:vim#search#pulse#mode = 'cursor_line'

" }}}
" {{{ vim-searchant

let g:searchant#all = 0 " only toggle current result highlight

" Disable Searchant highlight when incsearch.vim highlights also disable
autocmd CursorMoved * call SearchantStop()

func! SearchantStop() abort
  exec "normal \<Plug>SearchantStop"
endfunc

" }}}
" {{{ vim-test

" {{{ MochaStrategyTransform()

func! MochaStrategyTransform(cmd) abort
  if g:test#strategy == 'kitty'
    call SetKittySocketPathEnvVar()
  endif

  return 'NODE_PATH=lib NODE_ENV=test MOCHA=1 ' . a:cmd
endfunc

" }}}
" {{{ SetKittySocketPathEnvVar()

func! SetKittySocketPathEnvVar() abort
  let s:kitty_socket = 'unix:'
  let s:kitty_socket .= expand('/tmp/kitty_socket*')

  call setenv('KITTY_LISTEN_ON', s:kitty_socket)
endfunc

" }}}
" {{{ AutoSetTestStrategy()

func! AutoSetTestStrategy() abort
  call SetKittySocketPathEnvVar()

  if strlen($KITTY_LISTEN_ON) > 0
    let g:test#strategy = 'kitty'

    echo 'test strategy set to "kitty"'
  else
    let g:test#vim#term#position = "belowright"
    let g:test#strategy = 'neovim'

    echo 'test strategy set to "neovim"'
  endif
endfunc

" }}}
" {{{ strategy selection commands

command! TestViaNVIM call SetTestStrategyNVIM()
command! TestViaKitty call SetTestStrategyKitty()

" }}}
" {{{ detect project root
" https://github.com/janko/vim-test/issues/272_issuecomment-515749091

func! s:RunVimTest(cmd) abort
  for marker in g:root#markers
    let marker_file = findfile(marker, expand('%:p:h') . ';')
    if strlen(marker_file) > 0
      let g:test#project#root = fnamemodify(marker_file, ":p:h")
      break
    endif

    let marker_dir = finddir(marker, expand('%:p:h') . ';')

    if strlen(marker_dir) > 0
      let g:test#project#root = fnamemodify(marker_dir, ":p:h")
      break
    endif
  endfor

  execute a:cmd
endfunc

" }}}

call AutoSetTestStrategy()

let g:root#markers = ['package.json', 'yarn.lock', '.git/']

let g:test#javascript#mocha#options = '--verbose'
let g:test#transformation = 'mocha'
let g:test#custom#transformations = {
\ 'mocha': function('MochaStrategyTransform'),
\ }

" " let test_strategy = {
" "       'nearest': 'neovim',
" "       'file': 'kitty',
" "       'suite': 'kitty',
" "       }

" augroup test
" autocmd!
" autocmd BufWrite * if test_exists() | TestFile | endif
" augroup END

" }}}
" {{{ vimwiki

" {{{ - data

let g:x#wiki#fold#header_depth_regex = '/^#\+/'
let g:x#wiki#fold#blank_line_regex = '/\v^\s*$/'
let g:x#wiki#state#fold#valid = maktaba#enum#Create([
  \   'INITIAL',
  \   'EXPANDED',
  \   'COLLAPSED',
  \   'DIRTY',
  \ ])

let g:x#wiki#state#fold#default = g:x#wiki#state#fold#valid.INITIAL
let g:x#wiki#state#fold = v:null

" }}}
" {{{ - functions

" {{{ - s:xf3rno_wiki_init

" {{{   - s:xf3rno_wiki_init()

func! s:xf3rno_wiki_init() abort
  call <SID>xf3rno_wiki_state_fold_init()

  call <SID>xf3rno_wiki_init_mappings()
  call <SID>xf3rno_wiki_init_folding()
  call <SID>xf3rno_wiki_init_syntax_sync()

  call <SID>xf3rno_wiki_log_info('custom wiki init complete')
endfunc

" }}}
" {{{     - s:xf3rno_wiki_init_syntax_sync()
" Useful to fix highlighting in large files

func! s:xf3rno_wiki_init_syntax_sync() abort
  setlocal syntax sync fromstart
endfunc

" }}}
" {{{     - s:xf3rno_wiki_init_mappings()

func! s:xf3rno_wiki_init_mappings() abort
  noremap <buffer> <silent> <space>wl <SID>xf3rno_wiki_links_generate()
  noremap <buffer> <expr> <silent> fff <SID>xf3rno_wiki_folds_toggle()
endfunc

" }}}
" {{{     - s:xf3rno_wiki_init_folding()

func! s:xf3rno_wiki_init_folding() abort
  setlocal foldenable
  setlocal foldlevel=20
  setlocal foldmethod=expr
  setlocal foldexpr=s:xf3rno_wiki_folds_expr
endfunc

" }}}

" }}}
" {{{     - s:xf3rno_wiki_links

" {{{       - s:xf3rno_wiki_links_validate_paths(path, def_path)

func! s:xf3rno_wiki_links_validate_paths(paths) abort
  let s:paths = maktaba#ensure#IsList(a:paths)

  for s:path in s:paths
    exec maktaba#ensure#IsFile(s:path)
  endfor

  return v:true
endfunc

" }}}
" {{{       - s:xf3rno_wiki_links_prepare_paths(path, def_path)

func! s:xf3rno_wiki_links_prepare_paths(path, def_path) abort
  let s:arg_path = maktaba#ensure#IsString(a:path)
  let s:def_path = maktaba#ensure#IsString(a:def_path)
  let s:path = empty(s:arg_path) ? s:def_path || s:arg_path

  call <SID>xf3rno_wiki_links_validate_paths([ s:path ])

  return s:path
endfunc

" }}}
" {{{       - s:xf3rno_wiki_links_generate(params)

" TODO: Consider refactoring
func! s:xf3rno_wiki_links_generate(params) abort
  let s:params = maktaba#ensure#isDictionary(a:params)
  let s:write = maktaba#ensure#isBool(s:params.write || 1)
  let s:header = maktaba#ensure#isBool(s:params.header || 1)
  let s:arg_path = maktaba#ensure#IsString(s:params.path)
  let s:def_path = maktaba#ensure#isString(fnamemodify(@%, ':h'))
  let s:path = s:xf3rno_wiki_links_prepare_paths(s:arg_path, s:def_path)

  if s:header == 1
    let s:header_text = s:params.header_label || g:vimwiki#toc#header
    let s:header_label = maktaba#ensure#isString(s:header_text)
  else
    let s:header_label = v:null
  endif

  let s:rel_path = fnamemodify(s:path, ':h')
  let s:rel_file_paths = split(globpath(s:rel_path, '*'), '\n')
  let s:rel_file_count = len(s:rel_file_paths)

  if s:rel_file_count == 0
    return
  endif

  if s:write
    call appendbufline(bufname('%'), line('.'), s:rel_file_paths)

    call <SID>xf3rno_wiki_log_info('wrote %d links', s:rel_file_count)
  else
    call <SID>xf3rno_wiki_log_info('found %d links', s:rel_file_count)

    for s:file_path, s:i in s:rel_file_paths
      call <SID>xf3rno_wiki_log_success(' -> (%d/%d) %s', s:i + 1, s:rel_file_count, s:file_path)
    endfor
  endif
endfunc

" }}}

" }}}
" {{{     - s:xf3rno_wiki_util

" {{{        - s:xf3rno_wiki_util_match_header_line(line)

func! s:xf3rno_wiki_util_match_header_line(line) abort
  let s:regex = g:x#wiki#regex#header_depth
  let s:line = maktaba#ensure#IsString(a:line)

  return matchstr(s:line, s:regex)
endfunc

" }}}
" {{{        - s:xf3rno_wiki_util_match_blank_line(line)

func! s:xf3rno_wiki_util_match_blank_line(line) abort
  let s:regex = g:x#wiki#regex#blank_line
  let s:line = maktaba#ensure#IsString(a:line)

  return matchstr(s:line, s:regex)
endfunc

" }}}
" {{{        - s:xf3rno_wiki_util_get_header_depth(line)

func! s:xf3rno_wiki_util_get_header_depth(line) abort
  let s:regex = g:x#wiki#fold#header_depth_regex
  let s:line = maktaba#ensure#IsString(a:line)

  return strlen(s:xf3rno_wiki_util_match_header_line(s:line))
endfunc

" }}}
" {{{        - s:xf3rno_wiki_util_is_line_blank(line)

func! s:xf3rno_wiki_util_is_line_blank(line) abort
  let s:line = maktaba#ensure#IsString(a:line)
  let s:regex = g:x#wiki#fold#header_depth_regex

  return s:line =~? s:regex
endfunc

" }}}

" }}}
" {{{   - s:xf3rno_wiki_state

" {{{   - s:xf3rno_wiki_state_fold

" {{{     - s:xf3rno_wiki_state_fold(state)

func! s:xf3rno_wiki_state_fold(state) abort
  if empty(a:state)
    return s:xf3rno_wiki_state_fold
  endif

  let l:state = maktaba#ensure#IsString(a:state)
  let l:current_state = g:x#wiki#state#fold

  if maktaba#value#IsEqual(l:state, l:current_state)
    call <SID>xf3rno_wiki_log_debug('fold state unchaged')
    return
  endif

  let s:xf3rno_wiki_state_fold = X_wiki_state_fold_verify(l:state)

  call <SID>xf3rno_wiki_log_debug('wiki fold state now %s', X_wiki_state_fold)

  return X#wiki#state#fold
endfunc

" }}}
" {{{     - s:xf3rno_wiki_state_fold_init()

func! s:xf3rno_wiki_state_fold_init() abort
  let g:x#wiki#state#fold = g:x#wiki#state#fold#default
endfunc

" }}}
" {{{     - s:xf3rno_wiki_state_fold_verify(state)

func! s:xf3rno_wiki_state_fold_verify(state) abort
  let l:state = maktaba#ensure#IsString(a:state)
  let l:valid_states = g:x#wiki#state#fold#valid.Values()

  return maktaba#ensure#IsIn(l:state, l:valid_states)
endfunc

" }}}

" }}}

" }}}
" {{{   - s:xf3rno_wiki_log

const g:xf3rno#wiki#log = maktaba#log#Logger('wiki')

" {{{     - s:xf3rno_wiki_log_debug(...)

func! s:xf3rno_wiki_log_debug(...) abort
  call g:xf3rno#wiki#log.LogDebug(a:000)
endfunc

" }}}
" {{{     - s:xf3rno_wiki_log_info(...)

func! s:xf3rno_wiki_log_info(...) abort
  call g:xf3rno#wiki#log.LogInfo(a:000)
endfunc

" }}}
" {{{     - s:xf3rno_wiki_log_warn(...)

func! s:xf3rno_wiki_log_warn(...) abort
  call g:xf3rno#wiki#log.LogWarn(a:000)
endfunc

" }}}
" {{{     - s:xf3rno_wiki_log_error(...)

func! s:xf3rno_wiki_log_error(message, ...) abort
  call g:xf3rno#wiki#log.LogError(a:000)
endfunc

" }}}
" {{{     - s:xf3rno_wiki_log_severe(...)

func! s:xf3rno_wiki_log_severe(...) abort
  call g:xf3rno#wiki#log.LogSevere(a:000)
endfunc

" }}}

" }}}
" {{{   - s:xf3rno_wiki_folds

" {{{     - s:xf3rno_wiki_folds_toggle()

func! s:xf3rno_wiki_folds_toggle() abort
  let l:state_id = g:x#wiki#state#fold
  let l:state_name = g:x#wiki#state#fold#valid.Name(a:state_name)

  call <SID>xf3rno_wiki_state_fold_verify(l:state_name)

  if l:state_name == g:x#wiki#state#fold#valid.INITIAL
    call <SID>xf3rno_wiki_folds_initial()
  elseif l:state_name == g:x#wiki#state#fold#valid.EXPANDED
    call <SID>xf3rno_wiki_folds_expanded()
  elseif l:state_name == g:x#wiki#state#fold#valid.COLLAPSED
    call <SID>xf3rno_wiki_folds_collapsed()
  elseif l:state_name == g:x#wiki#state#fold#valid.DIRTY
    call <SID>xf3rno_wiki_folds_dirty()
  endif
endfunc

" }}}
" {{{     - s:xf3rno_wiki_folds_initial()

func! s:xf3rno_wiki_folds_initial() abort
  call <SID>xf3rno_folds_expand()
  call <SID>xf3rno_wiki_state_fold(g:x_wiki_state_fold_valid.EXPANDED)
endfunc

" }}}
" {{{     - s:xf3rno_wiki_folds_expanded()

func! s:xf3rno_wiki_folds_expanded() abort
  call <SID>xf3rno_folds_collapse()
  call <SID>xf3rno_wiki_state_fold(g:x_wiki_state_fold_valid.COLLAPSED)
endfunc

" }}}
" {{{     - s:xf3rno_wiki_folds_collapsed()

func! s:xf3rno_wiki_folds_collapsed() abort
  call <SID>xf3rno_folds_expand()
  call <SID>xf3rno_wiki_state_fold(g:x_wiki_state_fold_valid.EXPANDED)
endfunc

" }}}
" {{{     - s:xf3rno_wiki_folds_dirty()

func! s:xf3rno_wiki_folds_dirty() abort
  call <SID>xf3rno_folds_collapse()
  call <SID>xf3rno_folds_expand()
  call <SID>xf3rno_wiki_state_fold(g:x_wiki_state_fold_valid.INIT)
endfunc

" }}}
" {{{     - s:xf3rno_wiki_folds_expr(lnum)

" TODO: Add validation to check incoming line number
" TODO: Change returned strings to constants/an enum
func! s:xf3rno_wiki_folds_expr(line_n) abort
  let s:line_n = maktaba#ensure#IsNumber(a:line_n)
  let s:line = maktaba#ensure#IsString(trim(getline(s:line_n)))

  if empty(s:line)
    return '='
  endif

  if s:xf3rno_wiki_util_match_header_line(s:line)
    let s:indent_depth = s:xf3rno_wiki_util_get_header_depth(s:line)

    if s:indent_depth > 0
      return '>' . s:indent_depth
    endif

    return '='
  endif

  let s:is_blank_line = s:xf3rno_wiki_util_match_blank_line(s:line)

  if not s:is_blank_line
    return
  endif

  let s:next_line_n = s:line_n + 1

  " Out of bounds
  if s:next_line_n > getline('$')
    return '='
  endif

  " Check if blank line follows header
  let s:next_line = getline(s:next_line_n)
  let s:next_line_is_header = s:xf3rno_wiki_util_match_header_line(s:next_line)

  if s:next_line_n <= s:line_count && s:next_line_is_header
    return -1
  endif

  return '='
endfunc

" }}}

" }}}

" }}}
" {{{   - configuration

let g:vimwiki#path = $HOME . '/.src/github/xf3rno/vim-wiki'
let g:vimwiki#gen#projects#base#path = g:vimwiki#path

" {{{   - personal

let g:vimwiki#list = [{
  \ 'name': 'vimwiki',
  \ 'path': g:vimwiki#path . '/src',
  \ 'path_html': g:vimwiki#path . '/html',
  \ 'ext': '.wiki',
  \ 'auto_toc': 1,
  \ 'links_space_char': '_',
  \ 'diary_rel_path': 'journal/',
  \ 'diary_index': 'index',
  \ 'diary_header': 'Journal',
  \ 'diary_caption_level': 1,
  \ 'list_margin': 0,
  \ 'auto_tags': 1,
  \ 'auto_export': 1,
  \ 'auto_diary_index': 1,
  \ 'auto_gen_links': 1,
  \ 'auto_generate_tags': 1,
  \ 'html_filename_parameterization': 0,
  \ 'maxhi': 1,
  \ 'nested_syntaxes': {
  \   'ruby': 'ruby',
  \   'python': 'python',
  \   'css': 'css',
  \   'scss': 'scss',
  \   'go': 'go',
  \   'js': 'javascript',
  \   'json': 'json',
  \   'c++': 'cpp',
  \   'sh': 'sh',
  \   'racket': 'racket',
  \ }}]

" \ 'bullet_types': ['-', '•', '→'],
" \ 'syntax': 'markdown',

" }}}
" {{{   - global

let g:vimwiki#table#auto#fmt = 0
let g:vimwiki#create#link = 1
let g:vimwiki#markdown#link#ext = 0
let g:vimwiki#dir#link = 'index'
let g:vimwiki#table#mappings = 1
let g:vimwiki#auto#chdir = 0
let g:vimwiki#autowriteall = 1
let g:vimwiki#listsyms = ' SD'
let g:vimwiki#listsym#rejected = 'X'
let g:vimwiki#conceallevel = 2
let g:vimwiki#conceal#pre = 1
let g:vimwiki#conceal#onechar#markers = 1
let g:vimwiki#global#ext = 0
let g:vimwiki#auto#header = 1
let g:vimwiki#toc#header = 'Index'
let g:vimwiki#links#header = 'Links'
let g:vimwiki#tags#header = 'Tags'
let g:vimwiki#markdown#header#style = 1
let g:vimwiki#toc#header#level = 1
let g:vimwiki#links#header#level = 1
let g:vimwiki#tags#header#level = 1
let g:vimwiki#hl#headers = 1
let g:vimwiki#toc#link#format = 1
let g:vimwiki#folding='expr'
" let g:vimwiki_folding='expr:quick'
" let g:vimwiki_fold_lists = 0
let g:vimwiki#valid#html#tags = 'b,i,s,u,sub,sup,kbd,br,hr,pre,script'
let g:vimwiki#hl#cb#checked = 2
let g:vimwiki#filetypes = ['vimwiki']
" let g:vimwiki_ext2syntax = {
"       \ '.wiki': 'vimwiki',
"       \ }

" }}}
" }}}
" {{{ - autocmd init

autocmd FileType vimwiki UltiSnipsAddFiletypes <SID>xf3rno_init()

" }}}

" }}}
" {{{ taskwiki

" let g:taskwiki_dont_preserve_folds = 'yes'
" let g:taskwiki_disable_concealcursor = 'yes'
let g:taskwiki#markup#syntax = 'markdown'
let g:taskwiki#source#tw#colors = 'yes'
" let g:taskwiki_disable = 'yes'

" }}}
" {{{ vim-workspace

let g:workspace#create#new#tabs = 0
let g:workspace#autosave#untrailspaces = 0
let g:workspace#autosave = 0

if has('nvim')
let g:workspace#session#directory = $HOME . '/.config/nvim/sessions/'
else
let g:workspace#session#directory = $HOME . '/.vim/sessions/'
endif

" }}}
" {{{ vim-table-mode

let g:table#mode#always#active = 1
let g:table#mode#corner = '|'
let g:table#mode#align#char = ':'
let g:table#mode#delimiter = ','
let g:table#mode#disable#mappings = 0
let g:table#mode#syntax = 1 " experiment
let g:table#mode#auto#align = 0
let g:table#mode#update#time = 300
let g:table#mode#verbose = 1

" }}}
" {{{ vim-taskwarrior

" {{{ custom link handlers

" {{{ task list context

func! TWListContexts(url)
if a:url == 'TW_LIST_CONTEXTS'
return exec('r! task _context')
end

return ''
endfunc

" }}}

" }}}

let g:task#rc#override = 'rc._forcecolor=off  rc.defaultwidth=0 rc.defaultheight=0'

let g:task#report#name = 'next' " default task report type
let g:task#report#command = [] " custom reports have to be listed explicitly to make them available
let g:task#highlight#field = 1 " whether the field under the cursor is highlighted
let g:task#readonly = 0 " can not make change to task data when set to 1
let g:task#gui#term = 1 " vim built-in term for task undo in gvim
let g:taskult#prompt = ['due', 'description'] " default fields to ask when adding a new task
let g:task#info#vsplit = 1 " whether the info window is splited vertically
let g:task#info#size = 30 " info window size
let g:task#info#position = 'left' " info window position
let g:task#log#directory = '~/.task' " directory to store log files defaults to taskwarrior data.location
let g:task#log#max = '100' " max number of historical entries
let g:task#left#arrow = ' <<' " forward arrow shown on statusline

autocmd FileType vimwiki,taskwarrior :AnsiEsc

" }}}
" {{{ wakatime

let g:wakatime#OverrideCommandPrefix = '/home/xf3rno/.local/bin/wakatime'

" }}}

" }}}

" }}}

" }}}
" {{{ 3. configuration

" {{{ 3.b xf3rno function library

" {{{ - constants

let g:xf3rno#folds#levels#collapsed = 0
let g:xf3rno#folds#levels#expanded = 99

" }}}
" {{{ - functions

" {{{ - s:xf3rno_folds

" {{{   - s:xf3rno_folds_toggle()

func! s:xf3rno_folds_toggle() abort
  if &foldlevel > 0
    call <SID>xf3rno_folds_collapse()
  else
    call <SID>xf3rno_folds_expand()
  endif
endfunc

" }}}
" {{{   - s:xf3rno_folds_collapse()

func! s:xf3rno_folds_collapse() abort
  let &foldlevel = g:xf3rno#folds#levels#collapsed
endfunc

" }}}
" {{{   - s:xf3rno_folds_expand()

func! s:xf3rno_folds_expand() abort
  let &foldlevel = g:xf3rno#folds#levels#expanded
endfunc

" }}}

" }}}

" }}}

" }}}
" {{{ 3.a general configuration

" {{{ general

" Disable background erase for kitty
let &t_ut=''

" if has('nvim')
"   set rtp^='~/.nvim-plugins'
" else
"   set rtp^='~/.vim-plugins'
" endif


syntax enable

filetype plugin on
filetype indent on

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set timeout           " for mappings
set timeoutlen=300    " default value
set ttimeout          " for key codes
set ttimeoutlen=10    " unnoticeable small value

set shell=/bin/bash
set encoding=utf-8
set number
set nojoinspaces
set splitbelow
set showmatch
" set incsearch " incsearch.vim used
set hlsearch
set colorcolumn=80
set cmdheight=2
set signcolumn=yes
set tags=./tags;,tags;$HOME;
set regexpengine=1
set backspace=indent,eol,start
set autoread
set showtabline=2
set shortmess-=S
set showcmd
set smartcase
set hidden
set tw=79 " word wrap
set nocompatible
set equalalways
set wildignore+=*node_modules/**
set noswapfile
set nobackup
set nowritebackup
set concealcursor=nc
set conceallevel=3

" }}}
" {{{ folding

set foldmethod=marker
set foldcolumn=1
set foldlevel=1

" }}}
" {{{ statusline

" {{{ functions

func! StatuslineALE() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  if l:counts.total == 0
    return 'OK'
  endif

  return printf('%dW %dE', all_non_errors, all_errors)
endfunc

" }}}

set laststatus=2

" left
set statusline=
set statusline+=%#PmenuSel#
set statusline+=\ " padding
set statusline+=%{FugitiveHead()}
set statusline+=\ " padding
set statusline+=%#CursorColumn#
set statusline+=\ " padding
set statusline+=%{StatuslineALE()}
set statusline+=\ " padding
set statusline+=%{coc#status()}
set statusline+=\ " padding
set statusline+=%#LineNr#
set statusline+=\ " padding
set statusline+=%f

" right
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ " padding
set statusline+=%y
set statusline+=\ " padding
set statusline+=%#PmenuSel#
set statusline+=\ L%l\ %p%%
set statusline+=\ " padding

" }}} {{{ undo history

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

autocmd FileType snippets setlocal foldmethod=marker

" hacky fix for syntax highlighting in large files
autocmd WinEnter,Filetype * syntax sync fromstart

au BufNewFile,BufRead ~/.config/i3/config setf i3config
au BufNewFile,BufRead ~/.leptonrc setf json

" disable cursorline in insert mode
" autocmd InsertLeave,WinEnter * set cursorline
" autocmd InsertEnter,WinLeave * set nocursorline

" autosave
autocmd InsertLeave,TextChanged * update

" }}}
" {{{ JS block comment indent fix

func! s:CustomJSIndentExpr()
  if getline(v:lnum) !~ '^\s*\*'
    return GetJsxIndent() " Do normal indent
  else
    return -1 " Don't indent comments
  endif
endfunc

autocmd FileType javascript setlocal indentkeys+==* indentexpr=s:CustomJSIndentExpr()

" }}}
" {{{ statusline fix

" Fix for https://github.com/itchyny/lightline.vim/issues/448
" (affects builtin statusline as well)
func! FixLightlineStartupRender(timer)
  execute('resize -1')
  execute('resize +1')
endfunc

autocmd VimEnter * call timer_start(600, 'FixLightlineStartupRender')

" }}}

" }}}

" }}}
" {{{ 4. colorscheme

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
" falcon
" sierra
" srcery
" tender
" vim-farout
" vim-desertink

" }}}
" {{{ black

" base16-irblack
" moonfly
" archman
" vividchalk
" darkspace
" vim-hardaway

" }}}
" {{{ dual

" hemisu
" artesanal
" ayu
" gruvbox
" PaperColor

" }}}
" {{{ light

" sol
" mayansmoke
" flatwhite
" pencil
" paper
" kuroi
" shirotelin
" defminus
" summerfruit256

" }}}

" }}}
" {{{ enable 256 colors

set t_Co=256

if has("termguicolors")
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" }}}
" {{{ configuration

" {{{ ayu

" let ayucolor='light'
" let ayucolor='mirage'
let ayucolor='dark'

" }}}
" {{{ gruvbox

let g:gruvbox#contrast#dark = 'hard'
let g:gruvbox#improved#strings = 0
let g:gruvbox#improved#warnings = 0
let g:gruvbox#bold = 1
let g:gruvbox#italic = 1
let g:gruvbox#underline = 1
let g:gruvbox#invert#selection = 0

" }}}
" {{{ gruvbox_material

let g:gruvbox#material#background = 'hard'

" }}}
" {{{ OceanicMaterial

let g:oceanic#material#enable#bold = 1
let g:oceanic#material#enable#italic = 1

" }}}
" {{{ seoul256

" 233 (darkest) - 239 (lightest)
let g:seoul256#background = 234

" 252 (darkest) - 256 (lightest)
let g:seoul256#light#background = 252

" }}}
" {{{ sierra

let g:sierra#Twilight = 1

" }}}
" {{{ sonokai

" let g:sonokai_style = 'andromeda'
let g:sonokai#style = 'shusia'
" let g:sonokai_style = 'atlantis'
" let g:sonokai_style = 'maia'
let g:sonokai#enable#italic = 1

" }}}
" {{{ miramare

let g:miramare#enable#italic = 1

" }}}
" {{{ molokai

" let g:molokai_original = 1

" }}}
" {{{ NeoSolarized

let g:neosolarized#contrast = 'high' " low, normal, high
let g:neosolarized#visibility = "normal" " low, normal, high
let g:neosolarized#bold = 1
let g:neosolarized#underline = 1
let g:neosolarized#italic = 1

" }}}
" {{{ alduin

" Almost black bg
let g:alduin#Shout#Dragon#Aspect = 1

" Black bg
" let g:alduin_Shout_Become_Ethereal = 1

" Deep red for special highlighting groups
" let g:alduin_Shout_Fire_Breath = 1

" Remove block matchparens & add underline
" let g:alduin_Shout_Aura_Whisper = 1

" }}}
" {{{ one

let g:one#allow#italics = 1

" }}}
" {{{ sonokai

" shusia, andromeda, atlantis, maia
let g:sonokai#style = 'maia'
let g:sonokai#enable#italic = 1

" }}}
" {{{ srcery

let g:srcery#italic = 1

" }}}

" }}}

set background=dark

" moonfly
" vibrantink
" farout
" hemisu
" paper
" gotham
" desertink
" nova
" oceanic_material
" base16-irblack
" base16-github
" colorscheme ayu
colorscheme desertink

" }}}
" {{{ 5. gui

if has('gui_running') || exists('g:GtkGuiLoaded')

" {{{ font & dynamic size

" {{{ reference

" Iosevka
" FuraCode Nerd Font | cali
" Hasklug Nerd Font
" Input Mono (Normal|Narrow|Condensed|Compressed)
" Rec Mono (Linear|Duotone|SemiCasual|Casual)
" Victor Mono
" Operator Mono
" Hermit
" Source Code Pro
" JetBrainsMono Nerd Font
" BlexMono Nerd Font | liga, zero, frac

" }}}
" {{{ functions

func! SetFont()
  if has('nvim')
    call rpcnotify(1, 'Gui', 'Font', g:font#name . ' ' . g:font#size)
    call rpcnotify(1, 'Gui', 'FontFeatures', g:font#features)
  else
    let &guifont = g:font_name . " " . g:font_size
  endif
endfunc

func! AdjustFontSize(delta)
  let g:font#size += a:delta
  call SetFont()
endfunc

" }}}
" {{{ keybindings

nnoremap <C-=> :call AdjustFontSize(1)<cr>
nnoremap <C-+> :call AdjustFontSize(1)<cr>
nnoremap <C--> :call AdjustFontSize(-1)<cr>

" }}}

let g:font#name = 'Hasklug Nerd Font Medium'
let g:font#features = ''
let g:font#size = 10

call SetFont()

" }}}
" {{{ Neovim-GTK

if has('nvim')
  " Paste via shift + insert
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>

  call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
  call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
  call rpcnotify(1, 'Gui', 'Option', 'Cmdline', 0)

  let g:GuiInternalClipoard = 1
endif

" }}}
" {{{ GVim

if !has('nvim')
  set guioptions-=T " remove toolbar
  set guioptions-=m " remove menu bar
  set guioptions-=e " use terminal tabline
  set guioptions-=r " remove right scrollbar
  set guioptions-=L " remove left scrollbar

  " Paste via shift + insert
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif

" }}}
" {{{ cursor init

if has('nvim') && has('gui_running')
  set guicursor+=n-v-c-sm:block
  set guicursor+=i-ci-ve:ver25
  set guicursor+=r-cr-o:hor20
  set guicursor+=a:blinkon0
endif

" }}}

endif

" }}}
" {{{ 6. netrw

let g:netrw#banner = 0
let g:netrw#altv = 1 " split to right
" let g:netrw_browse_split = 2 " open file in right split
let g:netrw#sizestyle = "H" " human readable base 1024
let g:netrw#liststyle = 3
let g:netrw#winsize = 20
let g:netrw#nogx = 1
let g:netrw#browsex#viewer = 'xdg-open'

" }}}
" {{{ 7. search highlight toggle TODO

" TODO: Extract this as own plugin..

" {{{ 7.a functions

" {{{ - s:xf3rno_hlsearch_enable()

func! s:xf3rno_hlsearch_enable()
  setlocal hlsearch
endfunc

" }}}
" {{{ - s:xf3rno_hlsearch_disable()

func! s:xf3rno_hlsearch_disable()
  setlocal nohlsearch
endfunc

" }}}

" }}}
" {{{ 7.b autocommands

augroup xf3rno_dynamic_search_hl
  autocmd!
  autocmd InsertEnter * call <SID>xf3rno_hlsearch_disable()
  autocmd InsertLeave * call <SID>xf3rno_hlsearch_enable()
augroup END

" }}}

" }}}
" {{{ 8. keybindings

let mapleader = ','

" {{{ fast line movements

nnoremap J 2j
nnoremap K 2k

" }}}
" {{{ aerojump

nmap <space> <Plug>(AerojumpSpace)

" }}}
" {{{ ale

nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

" }}}
" {{{ buffer control

nnoremap <leader>n :bnext<cr>
nnoremap <leader>p :bprev<cr>
nnoremap <silent> <leader>bo :BufOnly<cr>

" }}}
" {{{ ctrl+backspace delete word

imap <C-BS> <C-W>
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" }}}
" {{{ coc

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <leader>rn <Plug>(coc-rename)
nmap <silent> <leader>rf <Plug>(coc-refactor)
xmap <silent> if <Plug>(coc-funcobj-i)
omap <silent> if <Plug>(coc-funcobj-i)
xmap <silent> af <Plug>(coc-funcobj-a)
omap <silent> af <Plug>(coc-funcobj-a)
xmap <silent> ic <Plug>(coc-classobj-i)
omap <silent> ic <Plug>(coc-classobj-i)
xmap <silent> ac <Plug>(coc-classobj-a)
omap <silent> ac <Plug>(coc-classobj-a)

nnoremap <silent> <leader>k :call CocAction('doHover')<cr>
inoremap <silent><expr> <c-space> coc#refresh()

" }}}
" {{{ easymotion

map in <Plug>(easymotion-next)
map iN <Plug>(easymotion-prev)

" }}}
" {{{ help

nnoremap <leader><s-h> :execute 'vert help ' . expand('<cword>')<cr>

" }}}
" {{{ fast quit

nnoremap <silent> <leader>q :qa<cr>
nnoremap <silent> <leader>Q :q!<cr>

" }}}
" {{{ folds

" {{{ FoldBlockByIndent()

func! s:FoldBlockByIndent() abort
  let s:orig_loc = getcurpos()
  let s:buf_num = s:orig_loc[0]
  let s:buf_info= getbufinfo(bufname())

  if len(s:buf_info) == 0
    throw 'no buffers open'
  endif

  let s:buf_len = s:buf_info[0]['linecount']

  let s:col = s:orig_loc[2]
  let s:indent_step = len(indent('.')) / &tabstop
  let s:indent_str = ''

  let s:block_start = 0
  let s:block_end = 0

  while s:block_start == 0 || s:block_end == 0
    if len(s:indent_str) >= len(getline('.'))
      throw 'found no block boundary below the cursor column (' . s:col . ')'
    endif

    let s:search_str = '^' . s:indent_str . '\S'
    let s:indent_str .= s:indent_step

    let s:block_start = search(s:search_str, 'bnw')
    let s:block_end = search(s:search_str, 'nw')
  endwhile

  call append(s:block_start - 1, ['', ''])
  call append(s:block_end + 2, ['', ''])

  let s:block_start += 2
  let s:block_end += 2

  call cursor([max([1, s:block_start - 2]), 1])
  exec 'normal! v' . min([s:buf_len, s:block_end + 2]) . 'G$zf'
  call cursor([s:orig_loc[1], s:orig_loc[2]])
endfunc

" }}}

" Surround visual block in a new fold
nnoremap <silent><expr> <leader>wf <SID>FoldBlockByIndent()

" Toggle fold
nnoremap <silent> <leader><Space> @=(foldlevel('.')?'za':"\<Space>")<cr>

" Toggle all folds
nnoremap <silent> fff :call <SID>xf3rno_folds_toggle()<cr>

" }}}
" {{{ fzf

nnoremap <C-p> call <SID>xf3rno_fzf_find_files()<cr>
nnoremap <leader>ZC :FZFCommands<cr>
nnoremap <leader>ZB :FZFBTags<cr>

" {{{ search open buffers
func! s:xf3rno_buff_list() abort
  let l:str = ''

  redir => l:str
  silent l:str
  redir END

  return split(l:str, '\n')
endfunc

func! s:xf3rno_buff_open_by_index(i) abort
  let l:i = marktab#ensure#IsNumber(a:i)
  let l:id = matchstr(l:i, '^[ 0-9]*')

  exec 'buffer ' . trim(l:id)
endfunc

func! s:xf3rno_fzf_open_buff_list() abort
  exec fzf#run({
    \   'source':  reverse(<SID>xf3rno_buff_list()),
    \   'sink':    function(<SID>xf3rno_buff_open_by_index),
    \   'down':    len(<SID>xf3rno_buff_list()) + 2,
    \   'options': '+m'
    \ })
endfunc

nnoremap <silent> <Leader><Enter> <SID>xf3rno_fzf_open_buff_list()

" }}}
" {{{ search tags

func! s:tags_sink(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2:], '^.*\ze;"\t')

  execute 'silent e' parts[1][:-2]

  let [magic, &magic] = [&magic, 0]

  execute excmd

  let &magic = magic
endfunc

func! s:tags()
  call fzf#run({
  'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
             '| grep -v -a ^!',
  'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
  'down':    '40%',
  'sink':    function('s:tags_sink')})
endfunc

command! Tags call <SID>tags()

" }}}

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
" {{{ js eslint (disabled)

" func! s:xf3rno_eslint_init() abort
"   setlocal makeprg=npm\ run\ lint\ --\ --quiet\ --no-color\ -f\ unix
"   nnoremap <buffer><silent> <leader>lf :make --fix <cr>:cwindow<cr>:redraw!<cr>
"   nnoremap <buffer><silent> <leader>l :make <cr>:cwindow<cr>:redraw!<cr>
" endfunc

" autocmd FileType javascript s:xf3rno_eslint_init()

" }}}
" {{{ mkdx (markdown)

autocmd FileType markdown nmap <buffer> <leader><cr> <Plug>(mkdx-enter)
autocmd FileType markdown nmap <buffer> <leader>mt <Plug>(mkdx-gen-or-upd-toc)
autocmd FileType markdown nmap <buffer> gf <Plug>(mkdx-gf)
" autocmd FileType markdown nmap <buffer> gx <Plug>(mkdx-gx)
autocmd FileType markdown nmap <buffer> <leader>m<space> <Plug>(mkdx-checkbox-next-n)
autocmd FileType markdown vmap <buffer> <leader>m<space> <Plug>(mkdx-checkbox-next-v)

" }}}
" {{{ netrw

nnoremap <leader>e :Lexplore<cr>

" }}}
" {{{ nuake

nnoremap <leader>T :Nuake<cr>
inoremap <leader>T <C-\><C-n>:Nuake<cr>
tnoremap <leader>T <C-\><C-n>:Nuake<cr>

" }}}
" {{{ open-browser.vim

nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

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
" {{{ vimwiki

" {{{ functions

" {{{ GetPathIfExists(path)

func! GetPathIfExists(path) abort
  return maktba#ensure#pathExists(a:path)
endfunc

" }}}
" {{{ GenVimWikiProjectFilePath(params)

func! GenVimWikiProjectFilePath(params) abort
  let s:params = maktba#ensure#isDictionary(a:params)
  let s:base_path = maktba#ensure#isString(a:params.base_path)
  let s:repo_name = maktba#ensure#isString(a:params.repo_name)
  let s:repo_scope = maktba#ensure#isString(a:params.repo_scope)
  let s:file_name = maktba#ensure#isString(a:params.file_name)

  let s:path = maktba#path#Join([s:base_path, s:repo_scope, s:repo_name])
  let s:get_path_func = maktba#function#Create(GetPathIfExists, [s:path])

  return maktba#error#Try(g:get#path#func, ['.*'], 0)
endfunc

" }}}
" {{{ PushVimWikiProjectFileLinkIfExists(params)

func! PushVimWikiProjectFileLinkIfExists(params) abort
  let s:file_path = GenVimWikiProjectFilePath(a:params)
  let s:shortcuts = a:params.shortcuts || []

  if len(s:file_path) > 0
    call add(s:shortcuts, [s:file_path])
  endif

  return s:shortcuts
endfunc

" }}}
" {{{ GenVimWikiLocalFileLink(params, file_name)

func! GenVimWikiLocalFileLink(params, file_name) abort
  let s:gen_params = copy(a:params)
  let s:prefix = a:params.prefix || ''
  let s:suffix = a:params.suffix || ''

  s:gen_params.file_name = a:file_name

  let s:file_path = GenVimWikiProjectFilePath(s:gen_params)
  let s:label =  s:prefix . s:gen_params.file_name . s:suffix

  return '[[local:' . s:file_path . '|' . s:label . ']]'
endfunc

" }}}
" {{{ GenVimWikiProjectTemplate(params)

" TODO: extract username/code folder base path
func! GenVimWikiProjectTemplate(params) abort
  let s:repo_tag = getline(0)
  let s:repo_name = substitute(s:repo_tag, ':', '', 'g')
  let s:repo_scope = maktaba#ensure#isString(a:params.repo_scope)
  let s:base_path = maktaba#ensure#isString(a:params.base_path)
  let s:repo_path = GenVimWikiProjectFilePath(a:params)
  let s:page_header = '= ' . s:repo_name . ' ='
  let s:existing_tasks = []

  call maktaba#ensure#PathExists(s:repo_path)

  call setpos('.', [bufnr(), 0, 0, 0])

  while search('/^\(\(\s\+\)?\)\*\s\[.\]\s\S\+$/', 'cW') != 0
    call add(s:existing_tasks, getline('.'))
  endwhile

  let s:shortucts = []
  let s:header_with_links = [s:page_header]
  let s:shared_repo_file_params = {
        'repo_name': s:repo_name,
        'repo_scope': s:repo_scope,
        'base_path': s:base_path,
        'shortcuts': s:shortcuts,
        }

  " TODO: Extract default task list
  let s:tasks = [
        '= Tasks =',
        '* [ ] polish !',
        '  * [ ] mv docs to `DOCUMENTATION.md`',
        '  * [ ] add standard-version script for changelog gen',
        '  * [ ] add `update-version` script',
        '  * [ ] generate `README.md` from template, embed API Docs if a applicable',
        '  * [ ] include `yarn docs` and yarn gen-readme` in husky hook',
        '* [ ] plan next steps',
        ]

  " Build list of valid shortucts to project files
  call PushVimWikiProjectFileLinkIfExists(s:shared_repo_file_params, '/')
  call PushVimWikiProjectFileLinkIfExists(s:shared_repo_file_params, 'README.md')
  call PushVimWikiProjectFileLinkIfExists(s:shared_repo_file_params, 'CHANGELOG.md')
  call PushVimWikiProjectFileLinkIfExists(s:shared_repo_file_params, 'DOCUMENTATION.md')

  let s:lines_to_append = []

  if !empty(s:shortcuts)
    call add(s:lines_to_append, s:shortcuts)
  endif

  if !empty(s:s:tasks)
    call add(s:lines_to_append, s:stasks)
  endif

  if (!empty(s:existing_tasks))
    call add(s:lines_to_append, [
      '',
      '----',
      '',
      ])
  endif

  " Apply changes
  call setbufline(0, 0, s:repo_tag)
  call setbufline(0, 2, s:page_header)
  call appendbufline(0, 3, s:lines_to_append)
endfunc

" }}}

" }}}
" {{{ keybindings

nnoremap <silent> <leader>SSS :call UltiSnips#RefreshSnippets()<cr>:echo 'ultisnips refreshed'<cr>
nnoremap <silent> <leader>vwp :call GenVimWikiProjectTemplate()

" }}}

" {{{ trim trailing spaces

nnoremap <leader><leader><leader> :%s/\s\+$//e<cr>

" }}}
" {{{ vim-js-file-import

nnoremap <silent><leader>ii <Plug>(JsFileImport)
nnoremap <silent><leader>il <Plug>(JsFileImportList)
nnoremap <silent><leader>ip <Plug>(PromptJsFileImport)
nnoremap <silent><leader>is <Plug>(SortJsFileImport)
nnoremap <silent><leader>ic <Plug>(JsFixImport)

" }}}
" {{{ vimrc

if has("nvim")
  nnoremap <silent> <leader>R :source ~/.config/nvim/init.vim<cr>
  nnoremap <silent> <leader>rr :e ~/.config/nvim/init.vim<cr>
else
  nnoremap <silent> <leader>R :source ~/.vimrc<cr>
  nnoremap <silent> <leader>rr :e ~/.vimrc<cr>
endif

" }}}
" {{{ visual-split.vim

xmap <leader>ss <Plug>(Visual-Split-VSSplit)
xmap <leader>sa <Plug>(Visual-Split-VSSplitAbove)
xmap <leader>sb <Plug>(Visual-Split-VSSplitBelow)

nmap <leader>ss <Plug>(Visual-Split-Split)
nmap <leader>sa <Plug>(Visual-Split-SplitAbove)
nmap <leader>sb <Plug>(Visual-Split-SplitBelow)

" }}}
" {{{ vim-markdown-toc

command! GMTOC GenTocGFM
command! UMTOC UpdateToc
command! RMTOC RemoveToc

" }}}
" {{{ vimwiki

nnoremap <space><space> <Plug>VimwikiToggleListItem
nnoremap <space>wti <Plug>VimwikiIncrementListItem
nnoremap <space>wtd <Plug>VimwikiDecrementListItem
nnoremap <space>wtr <Plug>VimwikiToggleRejectedListItem
nnoremap <buffer> <space>wl s:xf3rno_wiki_links_generate()

" }}}

" }}}

" }}}
