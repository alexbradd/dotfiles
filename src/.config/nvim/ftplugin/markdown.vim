"
" File:    ftplugin/markdown_mappings.vim
" Version: 20.01.0
" Author:  BreadyX
"
" ftplugin for markdown files. Requires the installation of vim-markdown and
" vim-surround.
"

if exists(':Toc') && exists(':Toct')
    nnoremap <silent> <leader>mt :Toc<CR>
    nnoremap <silent> <leader>mT :Toct<CR>
endif

autocmd FileType markdown,octopress let b:surround_{char2nr('i')} = "*\r*"
autocmd FileType markdown,octopress let b:surround_{char2nr('b')} = "**\r**"
