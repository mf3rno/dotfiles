" Language:    Morrowind script
" Maintainer:  mg979.git@gmail.com
" Last Change: dom 05 mag 2019

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetMwseIndent()
setlocal indentkeys+==end,=else

let b:undo_indent = "setl indentkeys< indentexpr<"

" Only define the function once.
if exists("*GetMwseIndent")
  finish
endif

let s:keepcpo= &cpo
set cpo&vim

function GetMwseIndent()
  let ignorecase_save = &ignorecase
  try
    let &ignorecase = 0
    return s:get_indent()
  finally
    let &ignorecase = ignorecase_save
  endtry
endfunc

function s:get_indent()
  " Find a non-blank line above the current line.
  let lnum = prevnonblank(v:lnum - 1)
  let cur_text = getline(v:lnum)

  " At the start of the file use zero indent.
  if lnum == 0
    return 0
  endif
  let prev_text = getline(lnum)

  " Add a 'shiftwidth' after if, while and else.
  let ind = indent(lnum)
  let i = match(prev_text, '^\s*\<\(ifx\?\|while\|el\%[seif]\)\>')
  if i >= 0
    let ind += shiftwidth()
  endif

  " Subtract a 'shiftwidth' on end/else
  if cur_text =~ '^\s*[eE]\(nd\|lse\)'
    let ind = ind - shiftwidth()
  endif

  return ind
endfunction

let &cpo = s:keepcpo
unlet s:keepcpo
" vim:sw=2

