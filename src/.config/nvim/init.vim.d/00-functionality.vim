"
" File:    init.vim.d/00-functionality.vim
" Version: 20.12.0
" Author:  BreadyX
"
" Module for init.vim that contains user defined functions
"

" Show documentation for word under cursor. Tied into coc's LSP features "
function! g:Show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Remove trailing whitespaces on write
let no_remove_trailing = ['markdown', 'latex']
autocmd BufWritePre * if index(no_remove_trailing, &ft) < 0 | %s/\s\+$//e

" Markdown stuff
autocmd FileType markdown let b:surround_{char2nr('i')} = "*\r*"
autocmd FileType markdown let b:surround_{char2nr('b')} = "**\r**"

