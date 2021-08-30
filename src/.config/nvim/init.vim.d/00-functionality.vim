"
" File:    init.vim.d/00-functionality.vim
" Version: 21.08.0
" Author:  BreadyX
"
" Module for init.vim that contains user defined functions and autocommands
"

" Show documentation for word under cursor. Tied into coc's LSP features "
function! g:Show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Remove trailing whitespaces on write
let no_remove_trailing = ['markdown', 'latex']
autocmd BufWritePre * if index(no_remove_trailing, &ft) < 0 | %s/\s\+$//e

autocmd CursorHold * silent call CocActionAsync('highlight')

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
