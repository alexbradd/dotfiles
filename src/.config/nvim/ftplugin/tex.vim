"
" File:    ftplugin/tex.vim
" Version: 21.10.0
" Author:  BreadyX
"
" ftplugin for tex/latex files. Requires insallation of vim-surround.
"

setlocal tabstop=2 shiftwidth=2
setlocal formatoptions+=t
setlocal spell spelllang=it

let b:surround_{char2nr('i')} = "\\textit{\r}"
let b:surround_{char2nr('b')} = "\\textbf{\r}"
let b:surround_{char2nr('h')} = "\\hl{\r}"
let b:surround_{char2nr('m')} = "\$\r\$"
let b:surround_{char2nr('d')} = "\\[\r\\]"
let b:surround_{char2nr('e')} = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
let b:surround_{char2nr('c')} = "\\\1command: \1{\r}"
