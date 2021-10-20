--
-- File: lua/autocommands.lua
-- Version: 21.11.0
--

local c = vim.cmd
local g = vim.g

-- Remove trailing whitespace on write
g.no_remove_trailing = { 'markdown' }
c [[autocmd BufWritePre * if index(no_remove_trailing, &ft) < 0 | %s/\s\+$//e]]

-- coc.nvim highlight
c [[autocmd CursorHold * silent call CocActionAsync('highlight')]]
