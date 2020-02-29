
fun! mwse#set_hi()
  " hi link mwseOperator Identifier
  hi mwseFunction ctermfg=109 guifg=#7fc1ca cterm=bold gui=bold
  hi mwseBlock guifg=#5fdf00 ctermfg=76 cterm=bold gui=bold
  hi mwseScript guifg=#ff4444 ctermfg=196 cterm=italic gui=italic
  hi mwseActor guifg=#569cd6 ctermfg=32 cterm=italic gui=italic
  " hi mwseCondition guifg=#5faf87 ctermfg=72
	hi mwseX ctermfg=176 guifg=#c586c0
	hi mwseFunctionX ctermfg=176 guifg=#c586c0
endfun

fun! mwse#goto_script()
  if !executable('head') || !executable('grep')
    echo '"head" and "grep" executables needed.'
    return
  endif
  let word = expand('<cword>')
  for f in glob('*', 0, 1)
    if !isdirectory(f) && !empty(system('head '.f.' | grep -e "egin '.word.'\s"'))
      exe "e" f
      if &ft != 'mwse'
        setfiletype mwse
      endif
      return
    endif
  endfor
  echo 'No scripts found with this name'
endfun

