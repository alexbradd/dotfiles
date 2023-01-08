--
-- File: ftplugin/markdown.lua
-- Version: 22.09.0
--

local o = vim.opt_local
local b = vim.b
local fn = vim.fn
local m = require('mapfn')

o.formatoptions:append('t')
o.textwidth = 80
o.spell = true
o.conceallevel = 2

b['surround_'..fn.char2nr('i')] = '_\r_'
b['surround_'..fn.char2nr('b')] = '**\r**'

b.indent_blankline_enabled = false

m.noremap('n', '<leader>mt', '<cmd>Toch<cr>')
m.noremap('n', '<leader>mT', '<cmd>Tocv<cr>')
