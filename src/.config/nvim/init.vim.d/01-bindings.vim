"
" File:    init.vim.d/01-bindings.vim
" Version: 21.02.0
" Author:  BreadyX
"
" Module for init.vim that defines custom key bindings.
" Depends on 00-functionality.vim
"

" Better movement within tabs and buffers
noremap <F2> gT
noremap <F3> gt
nnoremap <silent> <leader>n :bn<CR>
nnoremap <silent> <leader>p :bp<CR>
nnoremap <silent> <leader>c :bd<CR>

" Toggle list
nnoremap <silent> <F4> :set list!<CR>

" Easier split resize
nnoremap <silent> <leader>< :vertical res -5<CR>
nnoremap <silent> <leader>> :vertical res +5<CR>
nnoremap <silent> <leader>- :res -5<CR>
nnoremap <silent> <leader>+ :res +5<CR>

" Control buffer-wide spell check
nnoremap <silent> <leader>lx :setlocal spell!<CR>
nnoremap <silent> <leader>lit :setlocal spelllang=it<CR>
nnoremap <silent> <leader>len :setlocal spelllang=en<CR>
nnoremap <silent> <leader>lde :setlocal spelllang=de<CR>

" Enter terminal (requires neovim or Vim 8.2)
nnoremap <silent> <leader>t :terminal<CR>
nnoremap <silent> <leader>T :tabedit term://bash<CR>
nnoremap <silent> <leader>vt :vsplit term://bash<CR>
nnoremap <silent> <leader>ht :split term://bash<CR>

" --- goyo.vim
nnoremap <silent> <leader>d :Goyo<CR>

" --- fzf
nnoremap <silent> <leader>zf :Files<CR>
nnoremap <silent> <leader>zb :Buffers<CR>
nnoremap <silent> <leader>zt :Windows<CR>
nnoremap <silent> <leader>zg :Rg<CR>

nnoremap <silent> <leader>zgf :GFiles<CR>
nnoremap <silent> <leader>zgc :Commits<CR>
nnoremap <silent> <leader>zg? :GFiles?<CR>

" --- coc
" Auto complete
inoremap <silent><expr> <C-space> coc#refresh()

" Navigate diagnostics
nmap [g <Plug>(coc-diagnostic-prev)
nmap ]g <Plug>(coc-diagnostic-next)

" Gotos
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)

nnoremap <silent> <leader>lK :call Show_documentation<CR>

nmap <leader>ca <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)

" Rename symbol
nmap <silent> <leader>r <Plug>(coc-rename)

" Show stuff with coc's fuzzy search
nnoremap <silent> <leader>ls   :<C-u>CocList<cr>
nnoremap <silent> <leader>lsd  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <leader>lss  :<C-u>CocList symbols<cr>
nnoremap <silent> <leader>lse  :<C-u>CocList extensions<cr>
nnoremap <silent> <leader>lsc  :<C-u>CocList commands<cr>
