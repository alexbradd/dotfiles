"
" File: sinppets.vim
" Version: 21.2018.0
" Author: BreadyX
"
" Module for the init.vim that contains various snippets for different
" filetypes
"

" ## SNIPPETS ## "
	autocmd FileType tex inoremap \i \emph{}
	autocmd FileType tex inoremap \b \textbf{}
	autocmd FileType tex inoremap \u \underline{}
	autocmd FileType tex inoremap \img \begin{figure}[h]<Enter>\centering<Enter>\includegraphics[width=\textwidth]{}<Enter>\caption{}<Enter>\label{}<Enter><Backspace>\end{figure}<Esc>o
	autocmd FileType tex inoremap \wrp-img \begin{wrapfigure}{r}{3cm}<Enter>\centering<Enter>\includegraphics[width=2cm]{}<Enter>\caption{}<Enter>\label{}<Enter><Backspace>\end{wrapfigure}<Esc>o
	autocmd FileType tex inoremap \item \begin{itemize}<Enter>\item item<Enter>\end{itemize}
	autocmd FileType tex inoremap \enum \begin{enumerate}[1.]<Enter>\item item<Enter>\end{enumerate}
	autocmd FileType tex inoremap \desc \begin{description}<Enter>\item[IteamName] ItemDescription<Enter>\end{description}
		" bash
	autocmd FileType sh inoremap \shb <Esc>ggi#! /bin/bash<Enter>
	autocmd FileType sh inoremap \if if [   ]; then<Enter>#do stuff<Enter><Backspace>fi<Esc>kkwlli
	autocmd FileType sh inoremap \case case var in<Enter>"case")<Enter>#do stuff<Enter>;;<Enter>*)<Enter>#default<Enter>;;<Enter>esac<Esc>7kwi
	autocmd FileType sh inoremap \for for var in var; do<Enter>#do stuff<Enter>done<Esc>2kli
	autocmd FileType sh inoremap \cfor for (( i=0; i<var; i++ )); do<Enter>#do stuff<Enter>done<Esc>2k3li
	autocmd FileType sh inoremap \while while true; do<Enter>#do stuff<Enter>done<Esc>2kwi
	autocmd FileType sh inoremap \func function func {<Enter>#do stuff<Enter>}<Esc>2kwi
