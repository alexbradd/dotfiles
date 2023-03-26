return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = { mason = false },
        clangd = { mason = false },
        texlab = {
          mason = false,
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
        racket_langserver = { mason = false },
        rust_analyzer = {
          mason = false,
          settings = {
            ["rust-analyzer"] = {
              imports = {
                granularity = { group = "module" },
                prefix = "self",
              },
              cargo = { buildScripts = { enable = true } },
              procMacro = { enable = true },
            },
          },
        },
        hls = { mason = false },
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.prettierd,
          nls.builtins.formatting.stylua,
          nls.builtins.diagnostics.flake8,
          -- nls.builtins.diagnostics.shellcheck,
          -- nls.builtins.code_actions.shellcheck,
          nls.builtins.code_actions.gitsigns,
        },
      }
    end,
  },
}
