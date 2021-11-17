--
-- File: ftplugin/markdown.lua
-- Version: 21.11.1
--

local o = vim.opt_local
local b = vim.b
local fn = vim.fn
local wk = require('which-key')

local nvim_autopairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

o.formatoptions:append('t')
o.spell = true
o.conceallevel = 2

b['surround_'..fn.char2nr('i')] = '*\r*'
b['surround_'..fn.char2nr('b')] = '**\r**'

nvim_autopairs.add_rules({
    Rule('**', '**', 'markdown')
        :with_move(cond.before_regex_check('[%s%w]*'))
        :set_end_pair_length(2),
    Rule('_', '_', 'markdown')
        :with_move(cond.before_regex_check('[%s%w]*')),
})

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
