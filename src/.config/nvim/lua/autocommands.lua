--
-- File: lua/autocommands.lua
-- Version: 22.11.2
--
-- For autocmds relative to LSP stuff, see lsp.lua

local api = vim.api
local g = vim.g
local lualine = require('lualine')

local user_aug = api.nvim_create_augroup("UserConfig", { clear = true })
local goyo_aug = api.nvim_create_augroup('Goyo', { clear = true })

-- Remove trailing whitespace on write
vim.g.no_remove_trailing = { }
api.nvim_create_autocmd('BufWritePre', {
  group = user_aug,
  pattern = '*',
  command = [[if index(no_remove_trailing, &ft) < 0 | %s/\s\+$//e]]
})

-- Open all folds on open
api.nvim_create_autocmd('BufWinEnter', {
  group = user_aug,
  pattern = '*',
  command = [[let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))]]
})

-- Goyo
api.nvim_create_autocmd('User', {
  pattern = 'GoyoEnter',
  group = goyo_group,
  nested = true,
  callback = function()
    lualine.hide()
  end
})
api.nvim_create_autocmd('User', {
  pattern = 'GoyoLeave',
  group = goyo_group,
  nested = true,
  callback = function()
    lualine.hide { unhide = true }
  end
})
