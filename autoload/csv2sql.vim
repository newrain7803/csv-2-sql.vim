scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

function! csv2sql#export()
    echo "test"
endfunction
let &cpo = s:save_cpo
unlet s:save_cpo
