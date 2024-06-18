if vim.env._IS_DEV_ENV ~= "true" then
  return {
    { "williamboman/mason.nvim", enabled = false },
    { "williamboman/mason-lspconfig", enabled = false },
    { "neovim/nvim-lspconfig", enabled = false },
    { "stevearc/conform.nvim", enabled = false },
    { "mfussenegger/nvim-lint", enabled = false },
    { "hrsh7th/cmp-nvim-lsp", enabled = false }
  }
else
  return {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          texlab = {
            settings = {
              texlab = {
                build = { onSave = true },
                chktex = {
                  onEdit = true,
                  onOpenAndSave = true,
                },
              },
            },
          },
          clangd = {
            cmd = {
              "clangd",
              "--background-index",
              "--clang-tidy",
              "--header-insertion=iwyu",
              "--completion-style=detailed",
              "--function-arg-placeholders",
              "--fallback-style=llvm",
              "--log=error",
            },
          },
          -- racket_langserver = { mason = false },
          -- hls = { mason = false },
        },
      },
    },
    {
      "stevearc/conform.nvim",
      opts = {
        formatters_by_ft = {
          lua = { "stylua" },
          markdown = { "prettier" },
          sh = { "shfmt" },
        },
      },
    },
  }
end
