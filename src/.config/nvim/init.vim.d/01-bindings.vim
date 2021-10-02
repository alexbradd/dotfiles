"
" File:    init.vim.d/01-bindings.vim
" Version: 21.09.0
" Author:  BreadyX
"
" Module for init.vim that defines custom key bindings.
" Depends on 00-functionality.vim
"

" Better movement within tabs and buffers
noremap <F2> gT
noremap <F3> gt
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <silent> <leader>bp :bp<CR>
nnoremap <silent> <leader>bc :bd<CR>

" Toggle list
nnoremap <silent> <leader>ll :set list!<CR>

" Easier split resize
nnoremap <silent> <leader>< :vertical res -5<CR>
nnoremap <silent> <leader>> :vertical res +5<CR>
nnoremap <silent> <leader>- :res -5<CR>
nnoremap <silent> <leader>+ :res +5<CR>

" Control buffer-wide spell check
nnoremap <silent> <leader>L :setlocal spell!<CR>
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

" Show documentation for word under cursor. Tied into coc's LSP features
" Due to how <SID> works, it has to be defined here.
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>

" Navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

xmap <silent> <leader>cA <Plug>(coc-codeaction-selected)
nmap <silent> <leader>cA <Plug>(coc-codeaction-selected)
nmap <silent> <leader>ca <Plug>(coc-codeaction)
nmap <silent> <leader>cf <Plug>(coc-format)
nmap <silent> <leader>cF <Plug>(coc-format-selected)
nmap <silent> <leader>qf <Plug>(coc-fix-current)

" Rename symbol
nmap <silent> <leader>r <Plug>(coc-rename)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap <silent> if <Plug>(coc-funcobj-i)
omap <silent> if <Plug>(coc-funcobj-i)
xmap <silent> af <Plug>(coc-funcobj-a)
omap <silent> af <Plug>(coc-funcobj-a)
xmap <silent> ic <Plug>(coc-classobj-i)
omap <silent> ic <Plug>(coc-classobj-i)
xmap <silent> ac <Plug>(coc-classobj-a)
omap <silent> ac <Plug>(coc-classobj-a)

" Selection range
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Show stuff with coc's fuzzy search
nnoremap <silent> <leader>lS   :<C-u>CocList<cr>
nnoremap <silent> <leader>lsd  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <leader>lss  :<C-u>CocList symbols<cr>
nnoremap <silent> <leader>lse  :<C-u>CocList extensions<cr>
nnoremap <silent> <leader>lsc  :<C-u>CocList commands<cr>
