-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local api = vim.api

-- Do not override my globals wihtout telling me, thank you
api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local user_aug = api.nvim_create_augroup("UserConfig", { clear = true })

-- api.nvim_create_autocmd("ModeChanged", {
--   group = user_aug,
--   pattern = "*",
--   callback = function()
--     if
--       ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
--       and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
--       and not require("luasnip").session.jump_active
--     then
--       require("luasnip").unlink_current()
--     end
--   end,
-- })

vim.g.no_remove_trailing = {}
api.nvim_create_autocmd("BufWritePre", {
  group = user_aug,
  pattern = "*",
  command = [[if index(no_remove_trailing, &ft) < 0 | %s/\s\+$//e]],
})
