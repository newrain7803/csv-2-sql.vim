scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

function! csv2sql#export()
    execute 'rightbelow vne'
    let raw_text = csv2sql#read()
    let arr_text = split(raw_text,'\n')
    let column_name = remove(arr_text,0)
    let values  =  csv2sql#getValues(arr_text)
    let @@ = 'INSERT INTO TABLE_NAME ('.column_name.')'.'values'. values
    execute 'normal! p'
endfunction



function! csv2sql#read()
    let tmp = @@
    silent normal gvy
    let selected = @@
    let @@ = tmp
    return selected
endfunction

function! csv2sql#getValues(arr_text)
    let arr_values = []
    for text in a:arr_text
        call add(arr_values,split(text,','))
    endfor
    let str_value = ''
    let index = 1
    for line_values in arr_values
        let str_last = (index == len(arr_values))?'");':'"),'
        let str_value = str_value.'("'. join(line_values,'","') .str_last
        let index = index + 1
    endfor
    return str_value
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
