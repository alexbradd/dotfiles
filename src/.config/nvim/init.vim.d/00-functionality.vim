"
" File:    init.vim.d/00-functionality.vim
" Version: 21.10.1
" Author:  BreadyX
"
" Module for init.vim that contains user defined functions and autocommands
"

" Remove trailing whitespaces on write
let no_remove_trailing = ['markdown', 'latex']
autocmd BufWritePre * if index(no_remove_trailing, &ft) < 0 | %s/\s\+$//e

" --- coc
autocmd CursorHold * silent call CocActionAsync('highlight')

" --- nerdtree
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

