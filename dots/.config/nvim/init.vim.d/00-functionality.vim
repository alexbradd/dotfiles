"
" File: functionality.vim
" Version: 0.1
" Author: BreadyX
"
" Module for the init.vim that contains user defined functionality that modify
" installed plugins or add functionality
"

" FUNCTIONS "

" Set spelllang to desired lang. If spell is disabled, enable it"
function! g:Set_Spell(lang)
    if &spell ==# "nospell"
        set spell
    endif
    let &spelllang = a:lang
    echom 'Spell language set to ' . a:lang
endfunction

function! g:Toggle_CC()
    if &cc == 80
        set cc=0
    else
        set cc=80
    endif
endfunction

function! g:Show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

function! g:Install_Coc_Ext()
    execute 'CocInstall coc-python coc-ultisnips coc-vimtex'
endfunction

" AUTOCMDS  "
" Remove trailing whitespaces on write
let no_remove_trailing = ['markdown', 'latex']
autocmd BufWritePre * if index(no_remove_trailing, &ft) < 0 | %s/\s\+$//e

