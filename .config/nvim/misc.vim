"
" File: misc.vim
" Version: 12.2018.0
" Author: BreadyX
"
" Module for the init.vim that contains some miscellaneous functionality
"
" ## SCRIPT ADDITIONS ## "
		" Custom routines to GoyoEnter and GoyoLeave events
	function! s:goyo_enter()
		set showmode noshowcmd scrolloff=999
		Limelight
	endfunction
	function! s:goyo_leave()
		set showmode showcmd scrolloff=5
		Limelight!
	endfunction
	autocmd! User GoyoEnter nested call <SID>goyo_enter()
	autocmd! User GoyoLeave nested call <SID>goyo_leave()

"" ## OTHER FUNCTIONALITY ## "
	autocmd BufWritePre * %s/\s\+$//e	" remove trailing whitespaces on write
