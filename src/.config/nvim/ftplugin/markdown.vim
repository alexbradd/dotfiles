"
" File:    ftplugin/markdown.vim
" Version: 21.10.0
" Author:  BreadyX
"
" ftplugin for markdown files
"

setlocal tabstop=2 shiftwidth=2
setlocal formatoptions+=t
setlocal spell spelllang=it

let b:surround_{char2nr('i')} = "*\r*"
let b:surround_{char2nr('b')} = "**\r**"

nmap <buffer> <silent> <leader>mp <plug>MarkdownPreviewToggle

nnoremap <buffer> <silent> <leader>mt :Toch<CR>
nnoremap <buffer> <silent> <leader>mT :Tocv<CR>
