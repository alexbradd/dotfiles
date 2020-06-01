"
" File:    ftplugin/markdown.vim
" Version: 20.06.0
" Author:  BreadyX
"
" ftplugin for markdown files. Requires the installation of vim-markdown and
" vim-surround.
"

set spell

if exists(':Toc') && exists(':Toct')
    nnoremap <silent> <leader>mt :Toc<CR>
    nnoremap <silent> <leader>mT :Toct<CR>
endif

let b:surround_105 = "*\r*"
let b:surround_98 = "**\r**"

