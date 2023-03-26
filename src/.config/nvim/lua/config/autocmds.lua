-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local api = vim.api

local user_aug = api.nvim_create_augroup("UserConfig", { clear = true })

-- api.nvim_create_autocmd("BufWinEnter", {
-- 	group = user_aug,
-- 	pattern = "*",
-- 	command = [[normal zR]],
-- })

vim.g.no_remove_trailing = {}
api.nvim_create_autocmd("BufWritePre", {
  group = user_aug,
  pattern = "*",
  command = [[if index(no_remove_trailing, &ft) < 0 | %s/\s\+$//e]],
})
