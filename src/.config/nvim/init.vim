"
" File:    init.vim
" Version: 20.06.0
" Author:  BreadyX
"
" Main configuration file for Neovim. Uses vim-plug to setup various plug-ins and
" then loads the other 'modules' from the directory specified in g:module_dir.
"
" Each 'module' is a vimscript file that simply gets sourced. Each filename is
" made up of two parts:
"   nn-name.vim
" where 'nn' are two numbers [0-9] and 'name' is an arbitrary name. Higher the
" two numbers, later the file will be loaded. For example 00-* are first and
" 99-* are last. If two files have the same number, then they are loaded in
" alphabetical order based on their name.
"

" Module, config and plugin directories
let g:config_dir = $HOME . '/.config/nvim'
let g:module_dir = g:config_dir . '/init.vim.d'
let g:plugin_dir = $HOME . '/.local/share/nvim/plugged'

call plug#begin(g:plugin_dir)

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'SirVer/ultisnips'

Plug 'itchyny/lightline.vim'
Plug 'nanotech/jellybeans.vim'

call plug#end()

autocmd!

let s:file_list = split(globpath(g:module_dir, '*'))
for p in s:file_list
	execute 'source ' . fnameescape(p)
endfor
