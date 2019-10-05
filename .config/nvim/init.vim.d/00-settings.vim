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

filetype plugin on			" Determine filetype based on stuff
syntax on			        " Enable syntax highlighting
set showmatch			    " Highlight matching parenthesis

set tabstop=4 			    " Set tabs to be 4 spaces wide
set softtabstop=4 		    " Set tabs to be 4 spaces wide
set shiftwidth=4 		    " Set shift to be 4 spaces wide (1 tab)
set expandtab			    " Expand tabs
set list			        " Show tabs
set cc=80			        " Create 80 columns border

set encoding=utf-8	    	" Set NeoVim's encoding for opening files
set fileencoding=utf-8		" Set NeoVim's encoding for creating new files

set spell			        " Enable spelling
set spelllang=en		    " Set spell to en

set splitbelow splitright	" Change split spawning points
set wrap linebreak nolist	" Enable good looking line wrapping

set incsearch		    	" Enables incremental search
set hlsearch		    	" Enables search result highlighting

set hidden		            " Required for LanguageClient

" Theme
set termguicolors
set background=light
let g:PaperColor_Theme_Options = {
    \   'theme': {
    \       'default': {
    \           'allow_bold': 1,
    \           'allow_italic': 1,
    \       }
    \   }
    \ }
colorscheme PaperColor

" lightline
set noshowmode
let g:lightline = {
    \ 'colorscheme' : 'PaperColor',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename', 'modified', 'git-hud' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ],
    \              [ 'fileformat', 'fileencoding', 'filetype'] ],
    \ },
    \ }

" deoplete
" enable deoplete autocompletion
let g:deoplete#enable_at_startup = 1

" LanguageClient
let g:LanguageClient_serverCommands = {
    	\ 'c': [ '/usr/bin/clangd' ],
    	\ 'python' : [ '/usr/bin/pyls' ],
    	\ }

" neomake
call neomake#configure#automake('w')
let g:neomake_sh_enabled_makers = ['shellcheck']
let g:neomake_tex_enabled_makers = ['chktex']
let g:neomake_c_enabled_makers = []             " Disable because it has LSP
let g:neomake_python_enabled_makers = []        " Disable because it has LSP

" vim-markdown
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_math = 1
let g:vim_markdown_folding_level = 4

" ultisnips
let g:UltiSnipsSnippetDirectories=[ g:config_dir . '/ultisnips' ]
" Trigger configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
