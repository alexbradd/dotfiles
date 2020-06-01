"
" File:    init.vim.d/00-settings.vim
" Version: 20.06.0
" Author:  BreadyX
"
" Module for init.vim that contains settings.
"

" --- vim
set nocompatible			" Remove compatibility with VI
set nu rnu					" Enable line numbers and relative line numbers

set wildmenu
set wildmode=longest:full,full

filetype plugin on			" Determine filetype based on stuff
syntax on					" Enable syntax highlighting
set showmatch				" Highlight matching parenthesis

set tabstop=4				  " Set tabs to be 4 spaces wide
set softtabstop=0			  " Set tabs to be 4 spaces wide
set shiftwidth=4			  " Set indent to be 4 spaces wide (1 tab)
set noexpandtab				  " Don't Expand tabs
set listchars=tab:<.>,space:• " Placeholders for invisible characters
set cc=80					  " Create 80 columns border

set encoding=utf-8			" Set NeoVim's encoding for opening files
set fileencoding=utf-8		" Set NeoVim's encoding for creating new files

"set spell					" Enable spell check
set spelllang=en			" Set spell checking language to en

set splitbelow splitright	" Change split spawning points
set wrap linebreak nolist	" Enable good looking line wrapping

set incsearch				" Enables incremental search
set hlsearch				" Enables search result highlighting

set hidden					" Required for LanguageClient

" --- theme
set termguicolors

let g:jellybeans_overrides = {
\    'background': { 'guibg': 'none', 'ctermbg': 'none', '256ctermbg': 'none' },
\}
let g:jellybeans_use_term_italics = 1

colorscheme jellybeans

" --- lightline
set noshowmode
let g:lightline = {
	\ 'colorscheme' : 'jellybeans',
	\ 'active': {
	\	'left': [ [ 'mode', 'paste' ],
	\			  [ 'readonly', 'filename', 'modified', 'git-hud' ] ],
	\	'right': [ [ 'lineinfo' ],
	\			   [ 'percent' ],
	\			   [ 'fileformat', 'fileencoding', 'filetype'],
	\			   [ 'coc-status' ] ]
	\ },
	\ 'component_function': {
	\	'coc-status': 'coc#status'
	\ },
	\ }

" --- coc.vim
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes

" --- vim-markdown
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_math = 1
let g:vim_markdown_folding_level = 4
let g:vim_markdown_fenced_languages = [
	\ 'c++=cpp',
	\ 'viml=vim',
	\ 'bash=sh']

" --- ultisnips
let g:UltiSnipsSnippetDirectories=[ g:config_dir . '/ultisnips' ]
" Trigger configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
