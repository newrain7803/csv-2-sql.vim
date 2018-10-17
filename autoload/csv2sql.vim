scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

function! csv2sql#export()
    execute 'rightbelow vne'
    let raw_text = csv2sql#read()
    let arr_text = split(raw_text,'\n')
    let column_name = remove(arr_text,0)
    let str_text = '('.join(arr_text,'),(').');'
    let @@ = str_text
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
