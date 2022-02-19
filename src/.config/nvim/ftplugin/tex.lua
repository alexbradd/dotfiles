--
-- File: ftplugin/tex.lua
-- Version: 22.02.0
--

local o = vim.opt_local
local b = vim.b
local fn = vim.fn

o.formatoptions:append('t')
o.spell = true

b['surround_'..fn.char2nr('i')] = '\\textit{\r}'
b['surround_'..fn.char2nr('b')] = '\\textbf{\r}'
b['surround_'..fn.char2nr('h')] = '\\hl{\r}'
b['surround_'..fn.char2nr('m')] = '$\r$'
b['surround_'..fn.char2nr('d')] = '\\[\r\\]'
b['surround_'..fn.char2nr('e')] = '\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}'
b['surround_'..fn.char2nr('c')] = '\\\1command: \1{\r}'
