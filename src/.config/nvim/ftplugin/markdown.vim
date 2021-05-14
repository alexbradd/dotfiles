"
" File:    ftplugin/markdown.vim
" Version: 20.05.0
" Author:  BreadyX
"
" ftplugin for markdown files. Requires the installation of vim-markdown and
" vim-surround.
"

setlocal expandtab tabstop=2 shiftwidth=2
setlocal formatoptions+=t
setlocal textwidth=80
setlocal spell spelllang=it

let b:surround_{char2nr('i')} = "*\r*"
let b:surround_{char2nr('b')} = "**\r**"

nnoremap <buffer> <silent> <leader>mt :Toch<CR>
nnoremap <buffer> <silent> <leader>mT :Tocv<CR>
nnoremap <buffer> <silent> <leader>hi :HeaderIncrease<CR>
nnoremap <buffer> <silent> <leader>hd :HeaderDecrease<CR>
nnoremap <buffer> <silent> <leader>Hi V:HeaderIncrease<CR>
nnoremap <buffer> <silent> <leader>Hd V:HeaderDecrease<CR>

