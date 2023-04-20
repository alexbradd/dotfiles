-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local api = vim.api
local luasnip = require("luasnip")

local user_aug = api.nvim_create_augroup("UserConfig", { clear = true })
local luasnip_unlink = vim.api.nvim_create_augroup("UnlinkLuaSnipSnippetOnModeChange", {
  clear = true,
})

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

vim.api.nvim_create_autocmd("ModeChanged", {
  group = luasnip_unlink,
  pattern = { "s:n", "i:*" },
  desc = "Forget the current snippet when leaving the insert mode",
  callback = function(evt)
    -- If we have n active nodes, n - 1 will still remain after a `unlink_current()` call.
    -- We unlink all of them by wrapping the calls in a loop.
    while true do
      if luasnip.session and luasnip.session.current_nodes[evt.buf] and not luasnip.session.jump_active then
        luasnip.unlink_current()
      else
        break
      end
    end
  end,
})
