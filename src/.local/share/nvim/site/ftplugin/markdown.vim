"
" File:    ftplugin/markdown_mappings.vim
" Version: 20.03.0
" Author:  BreadyX
"
" ftplugin for markdown files. Requires the installation of vim-markdown and
" vim-surround.
"

if exists(':Toc') && exists(':Toct')
    nnoremap <silent> <leader>mt :Toc<CR>
    nnoremap <silent> <leader>mT :Toct<CR>
endif

let b:surround_{char2nr('i')} = "*\r*"
let b:surround_{char2nr('b')} = "**\r**"
