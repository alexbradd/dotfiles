"
" File: functionality.vim
" Version: 12.2018.0
" Author: BreadyX
"
" Module for the init.vim that contains user defined functionality that modify
" installed plugins or add functionality
"

" FUNCTIONS "

" Custom routines to GoyoEnter and GoyoLeave events
function! s:goyo_enter()
    set showmode noshowcmd scrolloff=999
    Limelight
endfunction
function! s:goyo_leave()
    set showmode showcmd scrolloff=5
    Limelight!
endfunction

" Function that sets spelllang with pretty output "
function! g:Set_Spell(lang)
    execute 'set spelllang=' . a:lang
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
"	autocmd BufWritePre * %s/\s\+$//e	" remove trailing whitespaces on write
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
autocmd FileType markdown,octopress let b:surround_{char2nr('i')} = "*\r*"
autocmd FileType markdown,octopress let b:surround_{char2nr('b')} = "**\r**"
