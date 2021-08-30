"
" File:    init.vim.d/01-bindings.vim
" Version: 21.08.0
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
nnoremap <silent> <leader>vt :vsplit term://bash<CR>
nnoremap <silent> <leader>ht :split term://bash<CR>

" --- fzf
nnoremap <silent> <leader>zf :Files<CR>
nnoremap <silent> <leader>zF :GFiles<CR>
nnoremap <silent> <leader>zb :Buffers<CR>
nnoremap <silent> <leader>zt :Windows<CR>
nnoremap <silent> <leader>zg :Rg<CR>

" --- fugitive
nnoremap <silent> <leader>gg :G<CR>
nnoremap <silent> <leader>gl :G -p slog<CR>
nnoremap <silent> <leader>gL :G -p gslog<CR>
nnoremap <silent> <leader>gd :G diff<CR>
nnoremap <silent> <leader>gb :G blame<CR>

" --- NERDTree
nnoremap <silent> <leader>t :NERDTreeFocus<CR>
nnoremap <silent> <C-n> :NERDTree<CR>
nnoremap <silent> <C-t> :NERDTreeToggle<CR>
nnoremap <silent> <C-f> :NERDTreeFind<CR>

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

xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>caa <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

" Rename symbol
nmap <silent> <leader>r <Plug>(coc-rename)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Selection range
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Show stuff with coc's fuzzy search
nnoremap <silent> <leader>ls   :<C-u>CocList<cr>
nnoremap <silent> <leader>lsd  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <leader>lss  :<C-u>CocList symbols<cr>
nnoremap <silent> <leader>lse  :<C-u>CocList extensions<cr>
nnoremap <silent> <leader>lsc  :<C-u>CocList commands<cr>
