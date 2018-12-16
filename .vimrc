"
" .vimrc
" Version: 12.2018.2
"

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

nnoremap j gj				" easier movement through wrapped lines
nnoremap k gk				" easier movement through wrapped lines
nnoremap $ g$				" easier movement through wrapped lines
nnoremap 0 g0				" easier movement through wrapped lines
nnoremap ^ g^				" easier movement through wrapped lines

noremap <C-j> <C-w>j			" easier movement between splits
noremap <C-k> <C-w>k			" easier movement between splits
noremap <C-h> <C-w>h			" easier movement between splits
noremap <C-l> <C-w>l			" easier movement between splits

noremap <silent> <F5> :source ~/.vimrc<CR>	" map resource .vimrc
noremap <silent> <C-t> :NERDTreeToggle<CR>	" map open nerdtree
" nnoremap <silent> <C-r> :nohl<CR>

nnoremap <C-p> :Goyo<CR>			" map goyo enable
nnoremap <silent> <C-o> :LLPStartPreview<CR> 	" map latex live preview
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
autocmd bufenter * if (winnr("$") == 0 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ### FUNCTIONALITY ###
autocmd BufWritePre * %s/\s\+$//e 				" remove trailing whitespaces on filesave
	" Templates
autocmd BufNewFile *.tex 0read ~/.vim/templates/latex 		" loads the latex template if a .tex file is created
command LoadTemplateLatex 0read ~/.vim/templates/latex 		" command to load latex template
