autocmd FileType tex,latex let b:surround_{char2nr('i')} = "\\textit{\r}"
autocmd FileType tex,latex let b:surround_{char2nr('b')} = "\\textbf{\r}"
autocmd FileType tex,latex let b:surround_{char2nr('h')} = "\\hl{\r}"
autocmd FileType tex,latex let b:surround_{char2nr('m')} = "\$\r\$"
autocmd FileType tex,latex let b:surround_{char2nr('d')} = "\\[\r\\]"
let b:surround_{char2nr('e')}
    \ = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
let b:surround_{char2nr('c')} = "\\\1command: \1{\r}"
