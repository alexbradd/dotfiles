"
" File: bindings.vim
" Version: 12.2018.1
" Author: BreadyX
"
" Module for init.vim that defines custom key bindings. It also contains some
" bindings to function defined in previous modules (e.g. Set_Spell())
"

" Better movement within tabs
noremap <F2> gT
noremap <F3> gt

" Easier split resize
nnoremap <leader>< :vertical res -5<CR>
nnoremap <leader>> :vertical res +5<CR>
nnoremap <leader>- :res -5<CR>
nnoremap <leader>+ :res +5<CR>

" Save file
nnoremap <silent> <C-s> :w<CR>
nnoremap <silent> <C-S> :wa<CR>

" Remove highlight
noremap <silent> gr :nohl<CR>

" Resource init.vim
nnoremap <silent> <F5> :source $MYVIMRC<CR>

" Toggle spell
nnoremap <silent> <leader>lx :set spell!<CR>

" Change spelllang
nnoremap <leader>lit :call Set_Spell('it')<CR>
nnoremap <leader>len :call Set_Spell('en')<CR>

" Toggle cc
nnoremap <silent> <leader>c :call Toggle_CC()<CR>

" Map LanguageClient dialog
nnoremap <F6> :call LanguageClient_contextMenu()<CR>
