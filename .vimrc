"
" .vimrc
" Version: 12.2018.8
"

" ### GENERAL SETTINGS ###
set nocompatible        			" Remove compatibility with vi
filetype indent plugin on       		" Determine filetype based on its extension ad contents to enable indent and specific plugins
syntax on               			" Enable syntax highlighting
set encoding=utf-8 fileencodings=utf-8		" default file encoding
set wildmode=longest,list,full			" vim command completion
set splitbelow splitright			" change split spawining point
set wrap linebreak nolist			" set good wrapping

" ### BINDINGS ###
noremap <F2> gT				" move between tabs
noremap <F3> gt				" move between tabs

nnoremap j gj				" easier movement through wrapped lines
nnoremap k gk				" easier movement through wrapped lines
nnoremap $ g$				" easier movement through wrapped lines
nnoremap 0 g0				" easier movement through wrapped lines
nnoremap ^ g^				" easier movement through wrapped lines

noremap <C-j> <C-w>j			" easier movement between splits
noremap <C-k> <C-w>k			" easier movement between splits
noremap <C-h> <C-w>h			" easier movement between splits
noremap <C-l> <C-w>l			" easier movement between splits

	" Disable arrowkey movement to force me to use hjkl
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

noremap <silent> <F5> :source ~/.vimrc<CR>	" map resource .vimrc
noremap <silent> <C-t> :NERDTreeToggle<CR>	" map open nerdtree
nnoremap <silent> <C-r> :nohl<CR>

nnoremap <silent> <C-p> :Goyo<CR>			" map goyo enable
nnoremap <silent> <C-o> :LLPStartPreview<CR> 	" map latex live preview
" ### AESTHETICZZ ###
set nu rnu              " enable line numbers and relative numbers
colorscheme dracula	" change color scheme
" hi Normal guibg=NONE ctermbg=NONE 	" get rid of the background
set hlsearch incsearch  " enable hilighting for search results

	" Lightline
set laststatus=2
set noshowmode
let g:lightline = {
	\ 'colorscheme': 'darcula',
	\ 'active': {
	\	'right': [ [ 'lineinfo' ],
	\		   [ 'percent' ],
	\		   [ 'fileencoding', 'filetype' ] ],
	\	'left': [ [ 'mode', 'paste' ],
	\		  [ 'readonly', 'filename', 'modified' ] ]
	\ },
	\ }

	" Goyo
let g:goyo_width = 120		" Goyo page dimenstions
let g:goyo_height = "85%"		" Goyo page dimenstions
let g:goyo_linenr = 1		" Enbale linenr even in Goyo
function! s:goyo_enter()	" custom routine for GoyoEnter event
	set showmode
	set noshowcmd
	set scrolloff=999
endfunction
function! s:goyo_leave()	" custom routine for GoyoLeave event
	set noshowmode
	set showcmd
	set scrolloff=5
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()	" adding custom routine to event
autocmd! User GoyoLeave nested call <SID>goyo_leave()	" adding custom routine to event

" ### FUNCTIONALITY ###
autocmd BufWritePre * %s/\s\+$//e 				" remove trailing whitespaces on filesave

	" Nerdtree
autocmd bufenter * if (winnr("$") == 0 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif	" close vim if only window open is nerdtree
autocmd StdinReadPre * let s:std_in=1													" Automatically open nerdtree if a directory is open
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif	" Automatically open nerdtree if a directory is open

	" Templates
autocmd BufNewFile *.tex 0read ~/.vim/templates/tex | set filetype=tex 		" loads the latex template if a .tex file is created
command! LoadTemplateTex 0read ~/.vim/templates/tex | set filetype=tex 		" command to load latex template

" ### SNIPPETS ###
	" tex
autocmd FileType tex inoremap \i \emph{}
autocmd FileType tex inoremap \b \textbf{}
autocmd FileType tex inoremap \u \underline{}
autocmd FileType tex inoremap \img \begin{figure}[h]<Enter>\centering<Enter>\includegraphics[width=\textwidth]{}<Enter>\caption{}<Enter>\label{}<Enter><Backspace>\end{figure}<Esc>o
autocmd FileType tex inoremap \wrp-img \begin{wrapfigure}{r}{3cm}<Enter>\centering<Enter>\includegraphics[width=2cm]{}<Enter>\caption{}<Enter>\label{}<Enter><Backspace>\end{wrapfigure}<Esc>o
autocmd FileType tex inoremap \item \begin{itemize}<Enter>\item item<Enter>\end{itemize}
autocmd FileType tex inoremap \enum \begin{enumerate}[1.]<Enter>\item item<Enter>\end{enumerate}
autocmd FileType tex inoremap \desc \begin{description}<Enter>\item[IteamName] ItemDescription<Enter>\end{description}
	" bash
autocmd FileType sh inoremap \shb <Esc>ggi#! /bin/bash<Enter>
autocmd FileType sh inoremap \if if [   ]; then<Enter>#do stuff<Enter><Backspace>fi<Esc>kkwlli
autocmd FileType sh inoremap \case case var in<Enter>"case")<Enter>#do stuff<Enter>;;<Enter>*)<Enter>#default<Enter>;;<Enter>esac<Esc>7kwi
autocmd FileType sh inoremap \for for var in var; do<Enter>#do stuff<Enter>done<Esc>2kli
autocmd FileType sh inoremap \cfor for (( i=0; i<var; i++ )); do<Enter>#do stuff<Enter>done<Esc>2k3li
autocmd FileType sh inoremap \while while true; do<Enter>#do stuff<Enter>done<Esc>2kwi
autocmd FileType sh inoremap \func function func {<Enter>#do stuff<Enter>}<Esc>2kwi
