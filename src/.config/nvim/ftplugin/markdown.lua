--
-- File: ftplugin/markdown.lua
-- Version: 21.11.1
--

local o = vim.opt_local
local b = vim.b
local fn = vim.fn
local wk = require('which-key')

o.formatoptions:append('t')
o.spell = true
o.conceallevel = 2

b['surround_'..fn.char2nr('i')] = '_\r_'
b['surround_'..fn.char2nr('b')] = '**\r**'


b.indent_blankline_enabled = false

wk.register(
    {
        m = {
            t = { '<cmd>Toch<cr>', "Horizontal table of contents" },
            T = { '<cmd>Tocv<cr>', "Vertical table of contents" },
        },
    },
    {
        mode = 'n',
        prefix = '<leader>',
        remap = false,
        silent = true,
    }
)
