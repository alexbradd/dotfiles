"
" File: functionality.vim
" Version: 12.2018.0
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

" AUTOCMDS  "
" Remove trailing whitespaces on write
let no_remove_trailing = ['markdown', 'latex']
autocmd BufWritePre * if index(no_remove_trailing, &ft) < 0 | %s/\s\+$//e

" Surround characters
autocmd FileType markdown,octopress let b:surround_{char2nr('i')} = "*\r*"
autocmd FileType markdown,octopress let b:surround_{char2nr('b')} = "**\r**"

autocmd FileType tex,latex let b:surround_{char2nr('i')} = "\\textit{\r}"
autocmd FileType tex,latex let b:surround_{char2nr('b')} = "\\textbf{\r}"
autocmd FileType tex,latex let b:surround_{char2nr('h')} = "\\hl{\r}"
autocmd FileType tex,latex let b:surround_{char2nr('m')} = "\$\r\$"
autocmd FileType tex,latex let b:surround_{char2nr('d')} = "\\[\r\\]"
