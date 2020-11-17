"
" File:    init.vim.d/01-bindings.vim
" Version: 20.06.0
" Author:  BreadyX
"
" Module for init.vim that defines custom key bindings.
" Depends on 00-functionality.vim
"

" Better movement within tabs
noremap <F2> gT
noremap <F3> gt
"
" Toggle list
nnoremap <silent> <F4> :set list!<CR>

" Easier split resize
nnoremap <silent> <leader>< :vertical res -5<CR>
nnoremap <silent> <leader>> :vertical res +5<CR>
nnoremap <silent> <leader>- :res -5<CR>
nnoremap <silent> <leader>+ :res +5<CR>

" Remove highlight
noremap <silent> <leader>r :nohl<CR>

" Control buffer-wide spell check
nnoremap <silent> <leader>lx :setlocal spell!<CR>
nnoremap <leader>lit :call Set_Spell('it')<CR>
nnoremap <leader>len :call Set_Spell('en')<CR>

" Toggle CC
nnoremap <silent> <leader>c :call Toggle_CC()<CR>

" Enter terminal (requires neovim or Vim 8.2)
nnoremap <silent> <leader>t :terminal<CR>
nnoremap <silent> <leader>vt :vsplit term://bash<CR>
nnoremap <silent> <leader>ht :split term://bash<CR>

" --- goyo.vim
nnoremap <silent> <leader>d :Goyo<CR>

" --- coc
" Auto complete
inoremap <silent><expr> <C-space> coc#refresh()

" Navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show documentation
nnoremap <silent> K :call Show_documentation()<CR>

" Rename symbol
nnoremap <silent> rn <Plug>(coc-rename)

" Show stuff with coc's fuzzy search
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
