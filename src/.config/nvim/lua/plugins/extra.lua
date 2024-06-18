local lazy_extras = {}
if vim.env._IS_DEV_ENV == "true" then
  vim.list_extend(lazy_extras, {
    "lazyvim.plugins.extras.coding.mini-surround",
    "lazyvim.plugins.extras.dap.core",
    "lazyvim.plugins.extras.editor.refactoring",
    "lazyvim.plugins.extras.lang.clangd",
    "lazyvim.plugins.extras.lsp.neoconf",
  })
end

local mapped_lazy_extras = vim.tbl_map(function(extra)
  return { import = extra }
end, lazy_extras)

local my_extras = {
  {
    "shortcuts/no-neck-pain.nvim",
    lazy = false,
    version = "*",
    opts = {
      width = 120,
      mappings = {
        enabled = false,
      },
    },
    keys = {
      { "<leader>np", "<cmd>NoNeckPain<cr>", desc = "Toggle NoNeckPain" },
      { "<leader>n=", "<cmd>NoNeckPainWidthUp<cr>", desc = "Increase the width" },
      { "<leader>n-", "<cmd>NoNeckPainWidthDown<cr>", desc = "Decrease the width" },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      defaults = {
        ["<leader>n"] = { name = "+NoNeckPain" },
      },
    },
  },
}

vim.list_extend(my_extras, mapped_lazy_extras)
return my_extras
