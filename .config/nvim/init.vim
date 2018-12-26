" Plugins (installed with vim-plug
	call plug#begin('~/.local/share/nvim/plugged')
		" AESTHETIC "
		Plug 'https://github.com/junegunn/goyo.vim.git'
		Plug 'https://github.com/junegunn/limelight.vim.git'
		" FUNCTIONALITY"
		Plug 'https://github.com/tpope/vim-surround.git'
		Plug 'https://github.com/xuhdev/vim-latex-live-preview.git'
		" LINT-COMPLETE "
		Plug 'https://github.com/w0rp/ale.git'
		Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

	call plug#end()
