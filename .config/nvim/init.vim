"
" File: init.vim
" Version: 12.2018.0
" Author: BreadyX
"
" Main config file for neovim. It declares all the used plugins and then
" delegates the various delarations/functionality to other modules located
" inside of g:config_dir
"


" ### Plugins (installed with vim-plug) ### "
	call plug#begin('~/.local/share/nvim/plugged')
		" AESTHETIC "
	Plug 'https://github.com/junegunn/goyo.vim.git'
	Plug 'https://github.com/junegunn/limelight.vim.git'
		" FUNCTIONALITY"
	Plug 'https://github.com/tpope/vim-surround.git'
	Plug 'https://github.com/xuhdev/vim-latex-live-preview.git'
		" LINT-COMPLETE "
"	Plug 'https://github.com/w0rp/ale.git'
	Plug 'https://github.com/neomake/neomake.git'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

	call plug#end()

" ## GENERAL ## "
		" declares path to folder containing all of the modules
	let g:config_dir = '/home/breadyx/.config/nvim/'
		" removes all autocommands on resourcing
	autocmd!
		" load settings module
	execute 'source ' . fnameescape(g:config_dir . 'settings.vim')
		" load binding module
	execute 'source ' . fnameescape(g:config_dir . 'bindings.vim')
 		" load template module
 	execute 'source ' . fnameescape(g:config_dir . 'templates.vim')
		" load snippets module
 	execute 'source ' . fnameescape(g:config_dir . 'snippets.vim')
		" load misc module
 	execute 'source ' . fnameescape(g:config_dir . 'misc.vim')
