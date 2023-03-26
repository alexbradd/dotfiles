-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del("n", "<leader>gG") -- remove default Lazygit

local wk = require("which-key")
wk.register({
  t = {
    name = "terminal",
    t = { "<cmd>e term://bash<cr>", "Open new terminal in new buffer" },
    h = { "<cmd>split term://bash<cr>", "Open new terminal in a new split" },
    v = { "<cmd>vsplit term://bash<cr>", "Open new terminal vertical split" },
  },
  u = {
    L = { "<cmd>set list!<cr>", "Toggle invisible chars" },
  },
}, { prefix = "<leader>" })
