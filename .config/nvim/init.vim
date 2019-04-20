"
" File: init.vim
" Version: 12.2018.0
" Author: BreadyX
"
" Main config file for Neovim. It declares plugins and then delegates the various 
" declarations/functionality to other modules located inside of g:config_dir
" (by default ~/.config/nvim/init.vim.d).
" Every module inside g:config_dir has a name made up of two parts: a priority
" (number), the name and the extension (e.g. 00-settings.vim). The files will
" be sourced in alphabetical order, so the priority ensures that the scripts
" are sourced in the correct order.
"

" PLUGINS (vim-plug) "
call plug#begin($HOME . '/.local/share/nvim/plugged')

" LINT-COMPLETE "
" Linting with LSP
Plug 'autozimu/LanguageClient-neovim', { 
	\ 'branch': 'next',
	\ 'do': 'bash install.sh',
	\ }
" Completion
Plug 'Shougo/deoplete.nvim', { 
	\ 'do': ':UpdateRemotePlugins',
	\ }
Plug 'neomake/neomake'			            " Automake
Plug 'plasticboy/vim-markdown'			    " Markdown support

" LANGUAGE SUPPORT "
Plug 'elzr/vim-json'						" Json support
Plug 'cespare/vim-toml'                     " TOML support
Plug 'lervag/vimtex'                        " Latex support

" FUNCTIONALITY"
Plug 'tpope/vim-surround'		            " Surround functionality
Plug 'godlygeek/tabular'					" Table layout
Plug 'tpope/vim-repeat'                     " Make command maps work with .
Plug 'SirVer/ultisnips'						" Snippet engine

" AESTHETIC "
Plug 'junegunn/goyo.vim'			        " More convenient window for prose
Plug 'junegunn/limelight.vim'	            " Pretty coloring

call plug#end()

" MODULE LOADING "

" declares path to folder containing all of the modules
let g:config_dir = $HOME . '/.config/nvim'

let g:module_dir = g:config_dir . '/init.vim.d'
let s:file_list = split(globpath(g:module_dir, '*'))

" removes all autocommands on resourcing
autocmd!

"Load all modules inside of init.vim.d
for p in s:file_list
	execute 'so ' . p
endfor
