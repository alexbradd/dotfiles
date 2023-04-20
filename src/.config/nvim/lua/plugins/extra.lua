return {
  -- { "editorconfig/editorconfig-vim" },
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gg", "<cmd>Git<cr>", desc = "Fugitive" },
      { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
    },
  },
  { "godlygeek/tabular", dependencies = { "plasticboy/vim-markdown" } },
  { "plasticboy/vim-markdown", ft = "markdown" },
  {
    "shortcuts/no-neck-pain.nvim",
    lazy = false,
    version = "*",
    opts = {
      mappings = {
        enabled = false,
      },
    },
    keys = {
      { "<leader>ug", "<cmd>NoNeckPain<cr>", desc = "Toggle NoNeckPain" },
    },
  },
}
