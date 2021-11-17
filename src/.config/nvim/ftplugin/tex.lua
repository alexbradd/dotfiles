--
-- File: ftplugin/tex.lua
-- Version: 21.11.1
--

local o = vim.opt_local
local b = vim.b
local fn = vim.fn

local nvim_autopairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

o.formatoptions:append('t')
o.spell = true

nvim_autopairs.add_rules({
    Rule('$$', '$', { 'tex', 'latex' })
        :with_move(cond.before_regex_check('[%s%w]*'))
        :set_end_pair_length(2),
    Rule('$', '$', { 'tex', 'latex' })
        :with_move(cond.before_regex_check('[%s%w]*')),
    Rule('\\(', '\\)', { 'tex', 'latex' })
        :with_move(cond.before_regex_check('[%s%w]*'))
        :set_end_pair_length(2),
    Rule('\\[', '\\]', { 'tex', 'latex' })
        :with_move(cond.before_regex_check('[%s%w]*'))
        :set_end_pair_length(2),
})

b['surround_'..fn.char2nr('i')] = '\\textit{\r}'
b['surround_'..fn.char2nr('b')] = '\\textbf{\r}'
b['surround_'..fn.char2nr('h')] = '\\hl{\r}'
b['surround_'..fn.char2nr('m')] = '$\r$'
b['surround_'..fn.char2nr('d')] = '\\[\r\\]'
b['surround_'..fn.char2nr('e')] = '\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}'
b['surround_'..fn.char2nr('c')] = '\\\1command: \1{\r}'
