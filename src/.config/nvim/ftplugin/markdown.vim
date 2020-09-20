"
" File:    ftplugin/markdown.vim
" Version: 20.09.0
" Author:  BreadyX
"
" ftplugin for markdown files. Requires the installation of vim-markdown and
" vim-surround.
"

set formatoptions+=t
set textwidth=80

if exists(':Toc') && exists(':Toct')
    nnoremap <silent> <leader>mt :Toc<CR>
    nnoremap <silent> <leader>mT :Toct<CR>
endif

autocmd FileType markdown,octopress let b:surround_{char2nr('i')} = "*\r*"
autocmd FileType markdown,octopress let b:surround_{char2nr('b')} = "**\r**"
