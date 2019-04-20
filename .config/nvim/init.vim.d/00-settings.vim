"
" File: settings.vim
" Version: 12.2018.1
" Author: BreadyX
"
" Module for the init.vim that contains some general settings as well some
" customization for plugins
"

" GENERAL SETTINGS "
set nocompatible	    	" Remove compatibility with VI
set nu rnu 			        " Enable line numbers and relative line numbers

filetype on			        " Determine filetype based on stuff
syntax on			        " Enable syntax highlighting
set wildmode=longest,list	" Sets up NeoVim's autocompletion (borrowed from Vim8)
set showmatch			    " Highlight matching parenthesis

set tabstop=4 softtabstop=4 " Set tabs to be 4 spaces wide 
set shiftwidth=4 expandtab	" Set shift to be 4 spaces wide and set tabs to be whitespaces
set cc=80			        " Create 80 columns border

set encoding=utf-8	    	" Set NeoVim's encoding for opening files
set fileencoding=utf-8		" Set NeoVim's encoding for creating new files

set spell spelllang=en		" Enable spelling and set it to en (can be changed with a function later)

set splitbelow splitright	" Change split spawning points
set wrap linebreak nolist	" Enable good looking line wrapping

set incsearch		    	" Enables incremental search
set hlsearch		    	" Enables search result highlighting

set hidden			        " Required for LanguageClient

" AESTHETIC AND CUSTOMIZATION "
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

" vim-markdown
"" disable header folding
let g:vim_markdown_folding_disabled = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" deoplete
" enable deoplete autocompletion
let g:deoplete#enable_at_startup = 1	

" LanguageClient
" Set linting programs
let g:LanguageClient_serverCommands = {
    \ 'c': [ '/usr/bin/clangd' ],
    \ 'python2' : [ '/usr/bin/pylint-2' ],
    \ 'python3' : [ '/usr/bin/pylint-3' ],
    \ }

" neomake
call neomake#configure#automake('nw', 500) 

" ultisnips
" Snippets directory
let g:UltiSnipsSnippetDirectories=[ g:config_dir . '/snippets' ]

" Trigger configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" let g:UltiSnipsEditSplit="vertical"
