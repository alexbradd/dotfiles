"
" File:    init.vim
" Version: 21.08.0
" Author:  BreadyX
"
" Main configuration file for Neovim. Uses vim-plug to setup various plug-ins
" and then loads the other 'modules' from the directory specified in
" g:module_dir.
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

" Directory where projects reside, used for project local overrides
let g:projects_dir = $HOME . '/projects'

call plug#begin(g:plugin_dir)

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'sheerun/vim-polyglot'

Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'hoob3rt/lualine.nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/local_vimrc'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

Plug 'godlygeek/tabular'
Plug 'SirVer/ultisnips'

Plug 'junegunn/goyo.vim'

Plug 'nanotech/jellybeans.vim'
Plug 'marko-cerovac/material.nvim'

call plug#end()

autocmd!

let s:file_list = split(globpath(g:module_dir, '*'))
for p in s:file_list
	execute 'source ' . fnameescape(p)
endfor
