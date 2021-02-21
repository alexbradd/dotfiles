"
" File:    init.vim.d/00-settings.vim
" Version: 21.02.1
" Author:  BreadyX
"
" Module for init.vim that contains settings.
"

" --- neovim
set nocompatible
set nu

filetype plugin on
syntax on

set encoding=utf-8
set fileencoding=utf-8

set splitbelow splitright

set tabstop=4
set softtabstop=0
set shiftwidth=4
set noexpandtab
set smartindent
set cc=80

set swapfile

set nowrap
set showmatch
set listchars=tab:<.>,space:•

set incsearch
set nohlsearch
set hidden

set cmdheight=2

set scrolloff=12

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
set updatetime=50
set shortmess+=c
set signcolumn=yes

let g:coc_global_extensions = [
	\ 'coc-clangd',
	\ 'coc-pyright',
	\ 'coc-markdownlint',
	\ 'coc-ultisnips',
	\ ]

" --- vim-markdown / polyglot
" let g:vim_markdown_folding_level = 1
" let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_fenced_languages = [
	\ 'c++=cpp',
	\ 'viml=vim',
	\ 'bash=sh']

" --- ultisnips
let g:UltiSnipsSnippetDirectories=[ g:config_dir . '/ultisnips' ]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
