-- vim.keymap.del("n", "<leader>gG") -- remove default Lazygit

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
