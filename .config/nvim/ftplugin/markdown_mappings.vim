""" REQUIRES vim-markdown """
if exists(':Toc') && exists(':Toct')
    nnoremap <silent> <leader>mt :Toc<CR>
    nnoremap <silent> <leader>mT :Toct<CR>
endif
