"
" File: settings.vim
" Version: 12.2018.1
" Author: BreadyX
"
" Module for the init.vim that contains some general settings as well some
" customization for some various plugins
"

" ## GENERAL SETTINGS ## "
	set nocompatible		" Remove compatibility with VI
	set nu rnu 			" Enable line numbers and relative line numbers
	filetype on			" Determine filetype based on stuff
	syntax on			" Enable syntax highlighting
	set encoding=utf-8		" Set NeoVim's encoding for opening files
	set fileencoding=utf-8		" Set NeoVim's encoding for creating new files
	set wildmode=longest,list,full	" Sets up NeoVim's autocompletion (borrowed from Vim8)
	set splitbelow splitright	" Change split spawining points
	set wrap linebreak nolist	" Enable good looking line wrapping
	set incsearch			" Enables incremental search
	set hlsearch			" Enables search result highlighting
	set hidden			" Required for LanguageClient

" ## AESTHETIC AND CUSTOMIZATION ## "
	colorscheme darcula

		" goyo.vim
		" Goyo page dimensions
	let g:goyo_width = 120
	let g:goyo_height = "85%"
		" Enable linenr even in Goyo
	let g:goyo_linenr = 1

		" limelight
		" Fix for unsupported colorscheme
	let g:limelight_conceal_ctermfg = 'gray'
	let g:limelight_conceal_guifg = 'DarkGray'
		" deoplete
	let g:deoplete#enable_at_startup = 1	" enable deoplete autocompletion

		" LanguageClient
	let g:LanguageClient_serverCommands = {
		\ 'c': [ '/usr/bin/clangd' ],
		\ }

		" neomake
		" Checks if computer is on battery, if not goes full out on
		" linting
	function! MyOnBattery() " function that checks for online AC
		if !empty(glob('/sys/class/power_supply/AC/online'))
			return readfile('/sys/class/power_supply/AC/online') == ['0']
		else
			return 1 == 0
		endif
	endfunction

	if MyOnBattery() " simple conditional to configure neomake
		call neomake#configure#automake('w')
	else
		call neomake#configure#automake('nw', 500)
	endif
