scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

noremap <Leader>z :call csv2sql#export()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
