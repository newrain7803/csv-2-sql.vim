scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

nmap <leader>c :call csv2sql#exportSql()<CR>


function! csv2sql#exportSql()
    echo 'test'
endfunction
let &cpo = s:save_cpo
unlet s:save_cpo
