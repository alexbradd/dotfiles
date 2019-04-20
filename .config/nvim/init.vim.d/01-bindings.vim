"
" File: bindings.vim
" Version: 12.2018.1
" Author: BreadyX
"
" Module for init.vim that defines custom key bindings. It also contains some
" bindings to function defined in previous modules (e.g. Set_Spell())
"

" BINDINGS "
" Better movement within tabs
noremap <F2> gT
noremap <F3> gt

" Better movement between splits
nnoremap gh <C-w>h
nnoremap gj <C-w>j
nnoremap gk <C-w>k
nnoremap gl <C-w>l

" Easier movement through wrapped lines
nnoremap j gj
" nnoremap <C-j> j

nnoremap k gk
" nnoremap <C-k> k

nnoremap 0 g0
nnoremap <C-0> 0

nnoremap ^ g^
nnoremap <C-^> ^

nnoremap $ g$
nnoremap <C-$> $

" Disable arrowkey movement to force me to learn hjkl
nnoremap <Left> :echo "No left for you!"<CR>
vnoremap <Left> :<C-u>echo "No left for you!"<CR>
inoremap <Left> <C-o>:echo "No left for you!"<CR>
nnoremap <Right> :echo "No right for you!"<CR>
vnoremap <Right> :<C-u>echo "No right for you!"<CR>
inoremap <Right> <C-o>:echo "No right for you!"<CR>
nnoremap <Up> :echo "No Up for you!"<CR>
vnoremap <Up> :<C-u>echo "No Up for you!"<CR>
inoremap <Up> <C-o>:echo "No Up for you!"<CR>
nnoremap <Down> :echo "No Down for you!"<CR>
vnoremap <Down> :<C-u>echo "No Down for you!"<CR>
inoremap <Down> <C-o>:echo "No Down for you!"<CR>

" Resource init.vim
nnoremap <silent> <F5> :source $MYVIMRC<CR>

" Change spelllang
nnoremap <C-l>it :call Set_Spell('it')<CR>
nnoremap <C-l>en :call Set_Spell('en')<CR>

" Toggle spell
nnoremap <silent> <C-l>x :set spell!<CR>

" Toggle cc
nnoremap <silent> <leader>c :call Toggle_CC()<CR>

" Redraw screen to delete highlighted search
noremap <silent> gr :nohl<CR>

" Enable goyo.vim
nnoremap <silent> <C-p> :Goyo<CR>

" Map LanguageClient dialog
nnoremap m :call LanguageClient_contextMenu()<CR>
