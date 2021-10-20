--
-- File: ftplugin/markdown.lua
-- Version: 21.11.0
--

local o = vim.opt_local
local b = vim.b
local fn = vim.fn
local wk = require('which-key')

o.tabstop = 2
o.shiftwidth = 2
o.formatoptions:append('t')
o.spell = true
o.spelllang = 'it'

b['surround_'..fn.char2nr('i')] = '*\r*'
b['surround_'..fn.char2nr('b')] = '**\r**'

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
