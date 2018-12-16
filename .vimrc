" Version: 12.2018.1

" ### GENERAL SETTINGS ###
set nocompatible        	" Remove compatibility with vi
filetype indent plugin on       " Determine filetype based on its extension ad contents to enable indent and specific plugins
syntax on               	" Enable syntax highlighting
set encoding=utf-8 fileencodings=utf-8		" default file encoding
set wildmode=longest,list,full	" vim command completion
set splitbelow splitright	" change split spawining point
set wrap linebreak nolist	" set good wrapping

" ### BINDINGS ###
noremap <F2> gT				" move between tabs
noremap <F3> gt				" move between tabe

nnoremap j gj				" move through wrapped lines
nnoremap k gk				" move through wrapped lines

noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l 

noremap <silent> <F5> :source ~/.vimrc<CR>
noremap <silent> <C-t> :NERDTreeToggle<CR>
" nnoremap <silent> <C-r> :nohl<CR>

" ### AESTHETICZZ ###
set nu rnu              " enable line numbers and relative numbers
colorscheme elflord	" change color scheme
set hlsearch incsearch  " enable hilighting for search results
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

" ### FUNCTIONALITY ###
noremap <C-p> :Goyo<CR>		" map goyo enable
