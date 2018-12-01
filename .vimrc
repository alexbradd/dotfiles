" Version: 12.2018.0
" ### GENERAL SETTINGS ###
set nocompatible        " Remove compatibility with vi
filetype indent plugin on       " Determine filetype based on its extension ad contents to enable indent and specific plugins
syntax on               " Enable syntax highlighting
set encoding=utf-8
set fileencodings=utf-8

" ### BINDINGS ###
" map <F2> :bprev<CR>
" map <F3> :bnext<CR>
map <F5> :source ~/.vimrc<CR>
map <C-o> :NERDTreeToggle<CR>
nnoremap <silent> <C-l> :nohl<CR>       " <Ctrl-l> refreshes the screen and remove highliting

" ### AESTHETICZZ ###
set nu                  " enable line numbers
set rnu			" enable relative line numbers
	" lightline
set laststatus=2
set noshowmode
let g:lightline = {
	\ 'colorscheme': 'jellybeans',
	\ 'active': {
	\	'right': [ [ 'lineinfo' ],
	\		   [ 'percent' ],
	\		   [ 'fileencoding', 'filetype' ] ],
	\	'left': [ [ 'mode', 'paste' ],
	\		  [ 'readonly', 'filename', 'modified' ] ]
	\ },
	\ }
	" nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif	
colorscheme slate       " change color scheme
set hlsearch            " enable hilighting for search results
