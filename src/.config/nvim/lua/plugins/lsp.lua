if vim.env._IS_DEV_ENV ~= "true" then
  return {
    { "neovim/nvim-lspconfig", enabled = false },
    { "jose-elias-alvarez/null-ls.nvim", enabled = false },
    { "williamboman/mason.nvim", enabled = false}
  }
else
  return {
    {
      "neovim/nvim-lspconfig",
      opts = {
        autoformat = false,
        servers = {
          pyright = {},
          clangd = {},
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
          -- racket_langserver = { mason = false },
          rust_analyzer = {
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
          -- hls = { mason = false },
        },
        setup = {
          clangd = function(_, opts)
            opts.capabilities.offsetEncoding = { "utf-16" }
          end,
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
end
