"
" File: templates.vim
" Version: 0.1
" Author: BreadyX
"
" Module for init.vim that declares some templates loaded on file creation and
" the standalone commands for loading said templates
"

" ## TEMPLATE LOGIC ## "
	" Define global directory where templates are stored
	let g:template_dir = $HOME . '/.config/nvim/templates'

	" Function that handles the loading of passed templates
	function! Load_Template(template)
		let l:path = g:template_dir . a:template
		if filereadable(l:path)
			execute '0read ' . fnameescape(l:path)
			let &filetype = a:template
			set filetype?
		else
			echo 'Template doesnt exist'
		endif
	endfunction

	" Command that silently calls the function for easier access
	command! -nargs=1 LoadTemplate :silent call Load_Template(<f-args>) | redraw!

" ## TEMPLATES ## "
		" TEX
	autocmd BufNewFile *.tex :LoadTemplate tex

