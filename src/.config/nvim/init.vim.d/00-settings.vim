"
" File:    init.vim.d/00-settings.vim
" Version: 21.08.0
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

set signcolumn=number

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
if $TERM !=# 'linux'
	if has('termguicolors')
		set termguicolors
	endif
	let g:material_style = 'darker'
	let g:material_italic_strings = v:true
	let g:material_italic_comments = v:true
	let g:material_hide_eob = v:true
	colorscheme material
else
	set guicursor=a:ver100
	colorscheme default
endif

" --- lualine
lua << EOF
require('lualine').setup {
	options = {
		-- icons_enabled = false,
		theme = 'material-nvim',
		component_separators = {'|', '|'},
		section_separators = {'', ''},
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch'},
		lualine_c = {'filename'},
		lualine_x = {
			'coc#status',
			'encoding',
			{ 'fileformat', icons_enabled = false },
			'filetype'
		},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	extensions = { 'fugitive', 'quickfix' }
}
EOF

" --- coc.vim
set updatetime=50
set shortmess+=c
set signcolumn=yes

let g:coc_global_extensions = [
	\ 'coc-clangd',
	\ 'coc-pyright',
	\ 'coc-tsserver',
	\ 'coc-vetur',
	\ 'coc-texlab',
	\ 'coc-markdownlint',
	\ 'coc-ultisnips',
	\ ]

" --- local_vimrc
call lh#local_vimrc#munge('whitelist', g:projects_dir)

" --- vim-markdown / polyglot
let g:vim_markdown_folding_level = 1
let g:vim_markdown_folding_style_pythonic = 1
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
