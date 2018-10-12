scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

function! csv2sql#export()
    execute 'rightbelow vne'
    let text = csv2sql#read()
    let @@ = json_encode(text)
    execute 'normal! p'
endfunction



function! csv2sql#read()
    let tmp = @@
    silent normal gvy
    let selected = @@
    let @@ = tmp
    return selected
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
