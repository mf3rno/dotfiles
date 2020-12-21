" {{{ 2. terminal

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
" {{{ 2. Plugins

" {{{

if has('nvim')
  call plug#begin($HOME . '/.nvim-plugins')
else
  call plug#begin($HOME . '/.vim-plugins')
end

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
Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'Yggdroot/indentLine'
" Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'majutsushi/tagbar'

" }}}
" {{{ testing

Plug 'janko/vim-test'

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

" {{{ configuration

" {{{ ale

let g:ale_enabled = 1

let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'typescript': ['eslint'],
\ 'json': ['eslint'],
\ 'ruby': ['rubocop'],
\ 'pug': ['puglint'],
\ 'scss': ['stylelint'],
\ 'css': ['stylelint'],
\ }

let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'json': ['fixjson'],
\ 'ruby': ['rubocop'],
\ 'scss': ['stylelint'],
\ 'css': ['stylelint'],
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

inoremap <silent><expr> <TAB>
\ pumvisible() ? coc#_select_confirm() :
\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ coc#refresh()

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

let g:coc_node_path = '/home/xf3rno/.nvm/versions/node/v15.4.0/bin/node'
let g:coc_node_args = ['--max-old-space-size=16384', '--no-warnings']

autocmd BufNewFile .gitignore CocCommand template.templateTop

" }}}
" {{{ echodoc

let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'virtual'

" }}}
" {{{ fzf

set rtp+=/usr/bin/fzf
set rtp+=/home/xf3rno/.cargo/bin

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
" {{{ MatchTagAlways

let g:mta_filetypes = {
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

let g:nuake_start_insert = 0
let g:nuake_position = 'bottom'
let g:nuake_size = 0.4

" }}}
" Pandoc {{{

let g:pandoc#folding#mode = 'syntax'
let g:pandoc#filetypes#handled = ["pandoc", "markdown", "rst"]
let g:pandoc#modules#enabled = ["formatting", "folding", "toc", "command", "menu", "bibliographies", "completion"]
let g:pandoc#folding#fold_yaml=1
let g:pandoc#syntax#conceal#urls=1
let g:pandoc#folding#fold_fenced_codeblocks = 1
" let g:pandoc#syntax#codeblocks#embeds#langs = ["python"]
" let g:pandoc#biblio#bibs = ["/home/alasdair/zettel/zettel.bib"]

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

" autocmd FileType js,javascript UltiSnipsAddFiletypes javascript-jsdoc

let g:UltiSnipsEnableSnipMate = 0
" let g:UltiSnipsSnippetDirectories = [
" \ '/home/xf3rno/.src/github/xf3rno/vim-snippets/UltiSnips',
" \ ]

let g:UltiSnipsExpandTrigger = '<c-space>'
let g:UltiSnipsListSnippets = '<nop>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
" let g:ultisnips_javascript = {
"       \ 'keyword-spacing': 'always',
"       \ 'semi': 'never',
"       \ 'space-before-function-paren': 'always',
"       \ }

" }}}
" {{{ vim-better-whitespace

let g:better_whitespace_enabled = 1

" }}}
" {{{ vim-better-comments

let g:bettercomments_included = ['javascript', 'js', 'go', 'ruby', 'python']

" }}}
" {{{ vim-diminactive

let g:diminactive_use_colorcolumn = 1
let g:diminactive_use_syntax = 1
let g:diminactive_enable_focus = 1

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
" {{{ vim-instant-markdown

let g:instant_markdown_autostart = 0

" }}}
" {{{ vim-javascript (replaced by vim-js)

" let g:javascript_plugin_jsdoc = 1
" let g:javascript_plugin_flow = 1

" }}}
" {{{ vim-js-file-import

let g:js_file_import_sort_after_insert = 1
let g:js_file_import_prompt_if_no_tag = 0
let g:js_file_import_omit_semicolon = 1
let g:js_file_import_use_fzf = 1
let g:js_file_import_no_mappings = 1

" }}}
" {{{ vim-jsx-pretty

let g:vim_jsx_pretty_colorful_config = 1

" }}}
" {{{ vim-markdown

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_folding_level = 2
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_edit_url_in = 'current' " 'vsplit'
let g:vim_markdown_autowrite = 1

" }}}
" {{{ vim-markdown-toc

let g:vmt_auto_update_on_save = 1
let g:vmt_dont_insert_fence = 0
let g:vmt_fence_hidden_markdown_style = 'GFM'
let g:vmt_cycle_list_item_markers = 0
let g:vmt_list_item_char = '-'
let g:vmt_include_headings_before = 1

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

" {{{ MochaStrategyTransform()

function! MochaStrategyTransform(cmd) abort
if g:test#strategy == 'kitty'
call SetKittySocketPathEnvVar()
endif

return 'NODE_PATH=lib NODE_ENV=test MOCHA=1 ' . a:cmd
endfunction

" }}}
" {{{ SetKittySocketPathEnvVar()

function! SetKittySocketPathEnvVar() abort
let s:kitty_socket = 'unix:'
let s:kitty_socket .= expand('/tmp/kitty_socket*')

call setenv('KITTY_LISTEN_ON', s:kitty_socket)
endfunction

" }}}
" {{{ AutoSetTestStrategy()

function! AutoSetTestStrategy() abort
call SetKittySocketPathEnvVar()

if strlen($KITTY_LISTEN_ON) > 0
let g:test#strategy = 'kitty'

echo 'test strategy set to "kitty"'
else
let g:test#vim#term_position = "belowright"
let g:test#strategy = 'neovim'

echo 'test strategy set to "neovim"'
endif
endfunction

" }}}
" {{{ strategy selection commands

command! TestViaNVIM call SetTestStrategyNVIM()
command! TestViaKitty call SetTestStrategyKitty()

" }}}
" {{{ detect project root
" https://github.com/janko/vim-test/issues/272#issuecomment-515749091

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

call AutoSetTestStrategy()

let g:root_markers = ['package.json', 'yarn.lock', '.git/']

let g:test#javascript#mocha#options = '--verbose'
let g:test#transformation = 'mocha'
let g:test#custom_transformations = {
\ 'mocha': function('MochaStrategyTransform'),
\ }

" let test#strategy = {
"       \ 'nearest': 'neovim',
"       \ 'file': 'kitty',
"       \ 'suite': 'kitty',
"       \ }

augroup test
autocmd!
autocmd BufWrite * if test#exists() | TestFile | endif
augroup END

" }}}
" {{{ vimwiki

" {{{ autocommands to fix minor issues

autocmd FileType vimwiki.markown UltiSnipsAddFiletypes vimwiki
autocmd FileType vimwiki :syntax sync fromstart
autocmd FileType vimwiki setlocal foldlevel=20

" }}}
" {{{ personal_wiki definition

let g:vimwiki_list = [{
\ 'name': 'personal_wiki',
\ 'path': '/home/xf3rno/.vimwiki/src',
\ 'bullet_types': ['-', '•', '→'],
\ 'path_html': '/home/xf3rno/.vimwiki/html',
\ 'ext': '.wiki',
\ 'syntax': 'markdown',
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
\ 'auto_generate_links': 1,
\ 'auto_generate_tags': 0,
\ 'html_filename_parameterization': 0,
\ 'maxhi': 1,
\ 'nested_syntaxes': {
\ 'ruby': 'ruby',
\ 'python': 'python',
\ 'css': 'css',
\ 'scss': 'scss',
\ 'go': 'go',
\ 'js': 'javascript',
\ 'json': 'json',
\ 'c++': 'cpp',
\ 'sh': 'sh',
\ 'racket': 'racket',
\ }}]

"}}}
" {{{ global wiki settings

let g:vimwiki_table_auto_fmt = 0
let g:vimwiki_create_link = 1
let g:vimwiki_markdown_link_ext = 0
let g:vimwiki_dir_link = 'index'
let g:vimwiki_table_mappings = 1
let g:vimwiki_auto_chdir = 0
let g:vimwiki_autowriteall = 1
let g:vimwiki_listsyms = ' SD'
let g:vimwiki_listsym_rejected = 'X'
let g:vimwiki_conceallevel = 2
let g:vimwiki_conceal_pre = 1
let g:vimwiki_conceal_onechar_markers = 1
let g:vimwiki_global_ext = 0
let g:vimwiki_auto_header = 1
let g:vimwiki_toc_header = 'Index'
let g:vimwiki_links_header = 'Links'
let g:vimwiki_tags_header = 'Tags'
let g:vimwiki_markdown_header_style = 1
let g:vimwiki_toc_header_level = 1
let g:vimwiki_links_header_level = 1
let g:vimwiki_tags_header_level = 1
let g:vimwiki_hl_headers = 1
let g:vimwiki_toc_link_format = 1
let g:vimwiki_folding='expr'
" let g:vimwiki_folding='expr:quick'
" let g:vimwiki_fold_lists = 0
let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr,pre,script'
let g:vimwiki_hl_cb_checked = 2
let g:vimwiki_filetypes = ['vimwiki']
" let g:vimwiki_ext2syntax = {
" \ '.wiki': 'vimwiki',
" \ }

" }}}

" }}}
" {{{ taskwiki

" let g:taskwiki_dont_preserve_folds = 'yes'
" let g:taskwiki_disable_concealcursor = 'yes'
let g:taskwiki_markup_syntax = 'markdown'
let g:taskwiki_source_tw_colors = 'yes'
" let g:taskwiki_disable = 'yes'

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
" {{{ vim-table-mode

let g:table_mode_always_active = 1
let g:table_mode_corner = '|'
let g:table_mode_align_char = ':'
let g:table_mode_delimiter = ','
let g:table_mode_disable_mappings = 0
let g:table_mode_syntax = 1 " experiment
let g:table_mode_auto_align = 0
let g:table_mode_update_time = 300
let g:table_mode_verbose = 1

" }}}
" {{{ vim-taskwarrior

" {{{ custom link handlers

" {{{ task list context

function! TWListContexts(url)
if a:url == 'TW_LIST_CONTEXTS'
return exec('r! task _context')
end

return ''
endfunction

" }}}

" }}}

let g:task_rc_override = 'rc._forcecolor=off  rc.defaultwidth=0 rc.defaultheight=0'

let g:task_report_name = 'next' " default task report type
let g:task_report_command = [] " custom reports have to be listed explicitly to make them available
let g:task_highlight_field = 1 " whether the field under the cursor is highlighted
let g:task_readonly = 0 " can not make change to task data when set to 1
let g:task_gui_term = 1 " vim built-in term for task undo in gvim
let g:task_default_prompt = ['due', 'description'] " default fields to ask when adding a new task
let g:task_info_vsplit = 1 " whether the info window is splited vertically
let g:task_info_size = 30 " info window size
let g:task_info_position = 'left' " info window position
let g:task_log_directory = '~/.task' " directory to store log files defaults to taskwarrior data.location
let g:task_log_max = '100' " max number of historical entries
let g:task_left_arrow = ' <<' " forward arrow shown on statusline

autocmd FileType vimwiki,taskwarrior :AnsiEsc

" }}}
" {{{ wakatime

let g:wakatime_OverrideCommandPrefix = '/home/xf3rno/.local/bin/wakatime'

" }}}

" }}}

" }}}
" {{{ 3. Base

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

function! StatuslineALE() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? 'OK' : printf(
  \   '%dW %dE',
  \   all_non_errors,
  \   all_errors
  \ )
endfunction

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
" {{{ statusline fix

" Fix for https://github.com/itchyny/lightline.vim/issues/448
" (affects builtin statusline as well)
function! FixLightlineStartupRender(timer)
  execute('resize -1')
  execute('resize +1')
endfunction

autocmd VimEnter * call timer_start(600, 'FixLightlineStartupRender')

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

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_improved_strings = 0
let g:gruvbox_improved_warnings = 0
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_underline = 1
let g:gruvbox_invert_selection = 0

" }}}
" {{{ gruvbox_material

let g:gruvbox_material_background = 'hard'

" }}}
" {{{ OceanicMaterial

let g:oceanic_material_enable_bold = 1
let g:oceanic_material_enable_italic = 1

" }}}
" {{{ seoul256

" 233 (darkest) - 239 (lightest)
let g:seoul256_background = 234

" 252 (darkest) - 256 (lightest)
let g:seoul256_light_background = 252

" }}}
" {{{ sierra

let g:sierra_Twilight = 1

" }}}
" {{{ sonokai

" let g:sonokai_style = 'andromeda'
let g:sonokai_style = 'shusia'
" let g:sonokai_style = 'atlantis'
" let g:sonokai_style = 'maia'
let g:sonokai_enable_italic = 1

" }}}
" {{{ miramare

let g:miramare_enable_italic = 1

" }}}
" {{{ molokai

" let g:molokai_original = 1

" }}}
" {{{ NeoSolarized

let g:neosolarized_contrast = 'high' " low, normal, high
let g:neosolarized_visibility = "normal" " low, normal, high
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1

" }}}
" {{{ alduin

" Almost black bg
let g:alduin_Shout_Dragon_Aspect = 1

" Black bg
" let g:alduin_Shout_Become_Ethereal = 1

" Deep red for special highlighting groups
" let g:alduin_Shout_Fire_Breath = 1

" Remove block matchparens & add underline
" let g:alduin_Shout_Aura_Whisper = 1

" }}}
" {{{ one

let g:one_allow_italics = 1

" }}}
" {{{ sonokai

" shusia, andromeda, atlantis, maia
let g:sonokai_style = 'maia'
let g:sonokai_enable_italic = 1

" }}}
" {{{ srcery

let g:srcery_italic = 1

" }}}

" }}}

set background=dark
" colorscheme moonfly
" colorscheme vibrantink
" colorscheme jellybeans
" colorscheme hemisu
" colorscheme paper
" colorscheme gotham
" colorscheme oceanic_material
" colorscheme base16-irblack
" colorscheme base16-github
colorscheme seoul256

" }}}
" {{{ 5. GUI

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

function! SetFont()
  if has('nvim')
    call rpcnotify(1, 'Gui', 'Font', g:font_name . ' ' . g:font_size)
    call rpcnotify(1, 'Gui', 'FontFeatures', g:font_features)
  else
    let &guifont = g:font_name . " " . g:font_size
  endif
endfunction

function! AdjustFontSize(delta)
  let g:font_size += a:delta
  call SetFont()
endfunction

" }}}
" {{{ keybindings

nnoremap <C-=> :call AdjustFontSize(1)<CR>
nnoremap <C-+> :call AdjustFontSize(1)<CR>
nnoremap <C--> :call AdjustFontSize(-1)<CR>

" }}}

let g:font_name = 'Hasklug Nerd Font Medium'
let g:font_features = ''
let g:font_size = 10

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

let g:netrw_banner = 0
let g:netrw_altv = 1 " split to right
" let g:netrw_browse_split = 2 " open file in right split
let g:netrw_sizestyle = "H" " human readable base 1024
let g:netrw_liststyle = 3
let g:netrw_winsize = 20
let g:netrw_nogx = 1
let g:netrw_browsex_viewer = 'xdg-open'

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
" {{{ aerojump

nmap <space> <Plug>(AerojumpSpace)

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

nnoremap <leader><s-h> :execute 'vert help :' . expand('<cword>')<cr>

" }}}
" {{{ fast quit

nnoremap <silent> <leader>q :qa<cr>
nnoremap <silent> <leader>Q :q!<cr>

" }}}
" {{{ folds

" {{{ FoldBlockByIndent()

function! FoldBlockByIndent()
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
endfunction

" }}}

" Surround visual block in a new fold
nnoremap <silent> <leader>wf :call FoldBlockByIndent()<cr>

nnoremap <expr> fff &foldlevel ? 'zM' :'zR'
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
" {{{ js eslint

autocmd FileType javascript
      \ setlocal makeprg=npm\ run\ lint\ --\ --quiet\ --no-color\ -f\ unix
      \ | nnoremap <buffer><silent> <leader>lf :make --fix <cr>:cwindow<cr>:redraw!<cr>
      \ | nnoremap <buffer><silent> <leader>l :make <cr>:cwindow<cr>:redraw!<cr>

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

nnoremap <leader>T :Nuake<CR>
inoremap <leader>T <C-\><C-n>:Nuake<CR>
tnoremap <leader>T <C-\><C-n>:Nuake<CR>

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
" {{{ ultisnips


" {{{ TEMPORARY: vimiwki project snippet mass-generator

let g:vimwiki_gen_projects_base_path = $HOME . '/.vimwiki'

function! GetPathIfExists(path) abort
  return maktba#ensure#pathExists(a:path)
endfunction

function! GenVimWikiProjectFilePath(params) abort
  let s:params = maktba#ensure#isDictionary(a:params)
  let s:base_path = maktba#ensure#isString(a:params.base_path)
  let s:repo_name = maktba#ensure#isString(a:params.repo_name)
  let s:repo_scope = maktba#ensure#isString(a:params.repo_scope)
  let s:file_name = maktba#ensure#isString(a:params.file_name)

  let s:path = maktba#path#Join([s:base_path, s:repo_scope, s:repo_name])
  let s:get_path_func = maktba#function#Create(GetPathIfExists, [s:path])

  return maktba#error#Try(g:get_path_func, ['.*'], 0)
endfunction

function! PushVimWikiProjectFileLinkIfExists(params) abort
  let s:file_path = GenVimWikiProjectFilePath(a:params)
  let s:shortcuts = a:params.shortcuts || []

  if len(s:file_path) > 0
    call add(s:shortcuts, [s:file_path])
  endif

  return s:shortcuts
endfunction

function! GenVimWikiLocalFileLink(params, file_name) abort
  let s:gen_params = copy(a:params)
  let s:prefix = a:params.prefix || '-> '
  let s:suffix = a:params.suffix || ''

  s:gen_params.file_name = a:file_name

  let s:file_path = GenVimWikiProjectFilePath(s:gen_params)
  let s:label =  s:prefix . s:gen_params.file_name . s:suffix

  return '[[local:' . s:file_path . '|' . s:label . ']]'
endfunction

" TODO: extract username/code folder base path
function! GenVimWikiProjectTemplate(params) abort
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
        \ 'repo_name': s:repo_name,
        \ 'repo_scope': s:repo_scope,
        \ 'base_path': s:base_path,
        \ 'shortcuts': s:shortcuts,
        \ }

  " TODO: Extract default task list
  let s:tasks = [
        \ '= Tasks =',
        \ '* [ ] polish !',
        \ '  * [ ] mv docs to `DOCUMENTATION.md`',
        \ '  * [ ] add standard-version script for changelog gen',
        \ '  * [ ] add `update-version` script',
        \ '  * [ ] generate `README.md` from template, embed API Docs if a applicable',
        \ '  * [ ] include `yarn docs` and yarn gen-readme` in husky hook',
        \ '* [ ] plan next steps',
        \ ]

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
      \ '',
      \ '----',
      \ '',
      \ ])
  endif

  " Apply changes
  call setbufline(0, 0, s:repo_tag)
  call setbufline(0, 2, s:page_header)
  call appendbufline(0, 3, s:lines_to_append)
endfunction

" }}}

nnoremap <silent> <leader>S :call UltiSnips#RefreshSnippets()<cr>:echo 'ultisnips refreshed'<cr>
" nnoremap <silent> <leader>vwp :call GenVimWikiProjectTemplate()

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

" {{{

" TODO: Extract this as a plugin (add functions), maybe `vimwiki-utils` or so
function! VimWikiUtilsGenLinks(params) abort
  " TODO: Refactor, line length..
  let s:params = maktaba#ensure#isDictionary(a:params)
  let s:path = maktaba#ensure#PathExists(s:params.path || fnamemodify(@%, ':h'))
  let s:write = maktaba#ensure#isBool(s:params.write || 1)
  let s:header = maktaba#ensure#isBool(s:params.header || 1)
  let s:header_label = g:vimwiki_toc_header || ''

  if s:header
    let s:header_label
    let s:header_label = maktaba#ensure#isString(s:params.header_label)
  endif

  let s:rel_path = fnamemodify(s:path, ':h')
  let s:rel_file_paths = split(globpath(s:rel_path, '*'), '\n')

  if s:write
    call appendbufline(bufname('%'), line('.'), s:rel_file_paths)
  else
    for s:file_path in s:rel_file_paths
      echo s:file_path
    endfor
  endif
endfunction

" }}}

map <space><space> <Plug>VimwikiToggleListItem
map <space>wti <Plug>VimwikiIncrementListItem
map <space>wtd <Plug>VimwikiDecrementListItem
map <space>wtr <Plug>VimwikiToggleRejectedListItem
nnoremap <buffer> <space>wl call GenerateLocalVimWikiLinks()

" }}}

" }}}
