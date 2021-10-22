--
-- File: ftplugin/tex.lua
-- Version: 21.11.0
--

local o = vim.opt_local
local b = vim.b
local fn = vim.fn

o.tabstop = 2
o.shiftwidth = 2
o.formatoptions:append('t')
o.spell = true

b['surround_'..fn.char2nr('i')] = '\\textit{\r}'
b['surround_'..fn.char2nr('b')] = '\\textbf{\r}'
b['surround_'..fn.char2nr('h')] = '\\hl{\r}'
b['surround_'..fn.char2nr('m')] = '\$\r\$'
b['surround_'..fn.char2nr('d')] = '\\[\r\\]'
b['surround_'..fn.char2nr('e')] = '\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}'
b['surround_'..fn.char2nr('c')] = '\\\1command: \1{\r}'
