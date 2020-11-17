"
" File:    init.vim.d/00-settings.vim
" Version: 20.11.0
" Author:  BreadyX
"
" Module for init.vim that contains settings.
"

" --- neovim
set nocompatible
set nu rnu

set wildmenu
set wildmode=longest:full,full

filetype plugin on
syntax on
set showmatch

set tabstop=8
set softtabstop=0
set shiftwidth=8
set noexpandtab
set listchars=tab:<.>,space:•
set cc=80

set encoding=utf-8
set fileencoding=utf-8

set spelllang=en

set splitbelow splitright
set wrap linebreak nolist

set incsearch
set hlsearch

set hidden

" --- theme
let g:jellybeans_overrides = {
	\	'background': {
	\		'ctermbg': 'none',
	\		'256ctermbg': 'none'
	\	},
	\}

if $TERM !=# 'linux'
	if has('termguicolors')
		set termguicolors
	endif
	let g:jellybeans_overrides['background']['guibg'] = 'none'
	let g:jellybeans_use_term_italics = 1
else
	set guicursor=a:ver100
	let g:jellybeans_use_lowcolor_black = 1
endif
colorscheme jellybeans

" --- goyo.vim
let g:goyo_width = 82
let g:goyo_height = 90
let g:goyo_linenr = 1

" --- lightline
set noshowmode
let g:lightline = {
	\	'colorscheme' : 'jellybeans',
	\	'active': {
	\		'left': [
	\			[ 'mode', 'paste' ],
	\			[ 'readonly', 'filename', 'modified', 'git-hud' ]
	\		],
	\		'right': [
	\			[ 'lineinfo' ],
	\			[ 'percent' ],
	\			[ 'fileformat', 'fileencoding', 'filetype'],
	\			[ 'coc-status' ]
	\		]
	\	},
	\	'component_function': {
	\		'coc-status': 'coc#status'
	\	},
	\}

" --- coc.vim
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes

" --- vim-markdown
" let g:vim_markdown_folding_level = 6
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_math = 1
let g:vim_markdown_fenced_languages = [
	\ 'c++=cpp',
	\ 'viml=vim',
	\ 'bash=sh']

" --- ultisnips
let g:UltiSnipsSnippetDirectories=[ g:config_dir . '/ultisnips' ]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
