"
" init.vim
" Version: 12.2018.0
"

" ### Plugins (installed with vim-plug) ### "
	call plug#begin('~/.local/share/nvim/plugged')
		" AESTHETIC "
	Plug 'https://github.com/junegunn/goyo.vim.git'
	Plug 'https://github.com/junegunn/limelight.vim.git'
		" FUNCTIONALITY"
	Plug 'https://github.com/tpope/vim-surround.git'
	Plug 'https://github.com/xuhdev/vim-latex-live-preview.git'
		" LINT-COMPLETE "
	Plug 'https://github.com/w0rp/ale.git'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

	call plug#end()

" ## GENERAL SETTINGS ## "
	set nu rnu 			" Enable line numbers and relative line numbers
	set nocompatible		" Remove compatibility with VI
	filetype on			" Determine filetype based on stuff
	syntax on			" Enable syntax highlighting
	set encoding=utf-8		" Set NeoVim's encoding for opening files
	set fileencoding=utf-8		" Set NeoVim's encoding for creating new files
	set splitbelow splitright	" Change split spawining points
	set wrap linebreak nolist	" Set good looking line wrapping

" ## BINDINGS ## "
		" Better movement within tabs
	noremap <F2> gT
	noremap <F3> gt
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

" ## AESTHETIC AND CUSTOMIZATION ## "
	colorscheme darcula
		" goyo.vim
		" Goyo page dimensions
	let g:goyo_width = 120
	let g:goyo_height = "85%"
		" Enable linenr even in Goyo
	let g:goyo_linenr = 1
		" Custom routines to GoyoEnter and GoyoLeave events
	function! s:goyo_enter()
		set showmode noshowcmd scrolloff=999
		Limelight
	endfunction
	function! s:goyo_leave()
		set showmode showcmd scrolloff=5
		Limelight!
	endfunction
	autocmd! User GoyoEnter nested call <SID>goyo_enter()
	autocmd! User GoyoLeave nested call <SID>goyo_leave()
" ## FUNCTIONALITY ## "
		" remove trailing whitespaces on filesave
	autocmd BufWritePre * %s/\s\+$//e
