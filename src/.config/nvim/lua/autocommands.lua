--
-- File: lua/autocommands.lua
-- Version: 22.09.1
--

local api = vim.api
local g = vim.g
local lualine = require('lualine')

-- Remove trailing whitespace on write
vim.g.no_remove_trailing = { 'markdown' }
api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  command = [[if index(no_remove_trailing, &ft) < 0 | %s/\s\+$//e]]
})

-- Open all folds on open
api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  command = [[let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))]]
})

api.nvim_create_augroup ('Goyo', { clear = true })
api.nvim_create_autocmd('User', {
  pattern = 'GoyoEnter',
  group = 'Goyo',
  nested = true,
  callback = function()
    lualine.hide()
  end
})
api.nvim_create_autocmd('User', {
  pattern = 'GoyoLeave',
  group = 'Goyo',
  nested = true,
  callback = function()
    lualine.hide { unhide = true }
  end
})
