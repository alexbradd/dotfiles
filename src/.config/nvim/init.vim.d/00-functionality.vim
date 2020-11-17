"
" File:    init.vim.d/00-functionality.vim
" Version: 20.06.0
" Author:  BreadyX
"
" Module for init.vim that contains user defined functions
"

" Set spelllang to desired lang. If spell is disabled, enable it"
function! g:Set_Spell(lang)
    if &spell ==# "nospell"
        setlocal spell
    endif
    let &l:spelllang = a:lang
    echom 'Spell language set to ' . a:lang
endfunction

" Toggle the 80 char marker "
function! g:Toggle_CC()
    if &cc == 80
        set cc=0
    else
        set cc=80
    endif
endfunction

" Show documentation for word under cursor. Tied into coc's LSP features "
function! g:Show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Install needed coc extensions "
function! g:Install_Coc_Ext()
    execute 'CocInstall coc-python coc-ultisnips coc-vimtex coc-clangd coc-markdownlint'
endfunction

" Remove trailing whitespaces on write
let no_remove_trailing = ['markdown', 'latex']
autocmd BufWritePre * if index(no_remove_trailing, &ft) < 0 | %s/\s\+$//e

" Force lightline update when coc updates
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Markdown stuff
autocmd FileType markdown let b:surround_{char2nr('i')} = "*\r*"
autocmd FileType markdown let b:surround_{char2nr('b')} = "**\r**"

