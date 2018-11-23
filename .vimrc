" ### GENERAL SETTINGS ###
set nocompatible        " Remove compatibility with vi
filetype indent plugin on       " Determine filetype based on its extension ad contents to enable indent and specific plugins
syntax on               " Enable syntax highlighting

" ### BINDINGS ###
map <F2> :bprev<CR>
map <F3> :bnext<CR>
map <F5> :source ~/.vimrc<CR>
nnoremap <silent> <C-l> :nohl<CR>       " <Ctrl-l> refreshes the screen and remove highliting

" ### AESTHETICZZ ###
set nu                  " enable line numbers
set rnu			" enable relative line numbers
colorscheme slate       " change color scheme
set hlsearch            " enable hilighting for search results
