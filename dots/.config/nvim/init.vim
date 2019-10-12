"
" File: init.vim
" Version: 0.1
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
" Plug 'autozimu/languageclient-neovim', {
" 	\ 'branch': 'next',
" 	\ 'do': 'bash install.sh',
" 	\ }					            " Linting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'Shougo/deoplete.nvim', {
" 	\ 'do': ':UpdateRemotePlugins',
" 	\ }					            " Completion
" Plug 'neomake/neomake'				" Automake

" Language support "
Plug 'plasticboy/vim-markdown'
Plug 'lervag/vimtex'

" Syntax highlighting "
Plug 'sheerun/vim-polyglot'			" Multiple language syntax hl

" FUNCTIONALITY"
Plug 'tpope/vim-surround'		    " Surround functionality
Plug 'tpope/vim-commentary'			" Commenting
Plug 'godlygeek/tabular'			" Table layout
Plug 'tpope/vim-repeat'             " Make command maps work with .
Plug 'SirVer/ultisnips'				" Snippet engine

" AESTHETIC "
Plug 'itchyny/lightline.vim'        " Pretty status line

" THEMES "
Plug 'rakr/vim-one'
Plug 'fneu/breezy'
" Plug 'NLKNguyen/papercolor-theme'

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
	execute 'source ' . fnameescape(p)
endfor
