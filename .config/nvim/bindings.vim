"
" File: bindings.vim
" Version: 12.2018.0
" Author: BreadyX
"
" Module for the init.vim that contains only various key bindings
"

" ## BINDINGS ## "
		" Better movement within tabs
	noremap <F2> gT
	noremap <F3> gt
		" Better movement between splits
	nnoremap gh <C-w>h
	nnoremap gj <C-w>j
	nnoremap gk <C-w>k
	nnoremap gl <C-w>l
		" Easier movement through wrapped lines
	nnoremap <C-j> gj
	nnoremap <C-k> gk
	nnoremap $ g$
	nnoremap 0 g0
	nnoremap ^ g^
		" Disable arrowkey movement to force me to learn hjkl
	nnoremap <Left> :echo "No left for you!"<CR>
	vnoremap <Left> :<C-u>echo "No left for you!"<CR>
	inoremap <Left> <C-o>:echo "No left for you!"<CR>
	nnoremap <Right> :echo "No right for you!"<CR>
	vnoremap <Right> :<C-u>echo "No right for you!"<CR>
	inoremap <Right> <C-o>:echo "No right for you2!"<CR>
	nnoremap <Up> :echo "No Up for you!"<CR>
	vnoremap <Up> :<C-u>echo "No Up for you!"<CR>
	inoremap <Up> <C-o>:echo "No Up for you!"<CR>
	nnoremap <Down> :echo "No Down for you!"<CR>
	vnoremap <Down> :<C-u>echo "No Down for you!"<CR>
	inoremap <Down> <C-o>:echo "No Down for you!"<CR>
		" Resource init.vim
	nnoremap <silent> <F5> :source $MYVIMRC<CR>
		" Redraw screen to delete highlighted search
	nnoremap <silent> <C-r> :nohl<CR>
		" Enable goyo.vim
	nnoremap <silent> <C-p> :Goyo<CR>
		" Enable latex preview
	nnoremap <silent> <C-o> :LLPStartPreview<Cr>
