if exists('b:did_ftplugin')
  finish
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <buffer> gF :call mwse#goto_script()<cr>

setlocal expandtab softtabstop=2 tabstop=2 shiftwidth=2 tw=79
setlocal commentstring=;%s

let b:did_ftplugin = 1
let b:commentary_format = '; %s'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if &background == 'dark'
  call mwse#set_hi()
endif

autocmd Colorscheme <buffer>  call mwse#set_hi()
