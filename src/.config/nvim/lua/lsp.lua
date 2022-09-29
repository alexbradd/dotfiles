--
-- File: lua/lsp.lua
-- Version: 22.09.1
--

local m = require('mappings')
local lspconfig = require('lspconfig')

vim.diagnostic.config {
  update_in_insert = true,
  signs = true,
  virtual_text = false,
  float = {
    focusable = false
  }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local on_attach = function(client, bufnr)
  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

  m.noremapBuf('n', 'gD', vim.lsp.buf.declaration, bufnr)
  m.noremapBuf('n', 'gd', vim.lsp.buf.definition, bufnr)
  m.noremapBuf('n', 'gi', vim.lsp.buf.implementation, bufnr)
  m.noremapBuf('n', 'gr', vim.lsp.buf.references, bufnr)

  m.noremapBuf('n', 'K', vim.lsp.buf.hover, bufnr)
  m.noremapBuf('n', '<C-k>', vim.lsp.buf.signature_help, bufnr)

  m.noremapBuf('n', '[g', vim.diagnostic.goto_prev, bufnr)
  m.noremapBuf('n', ']g', vim.diagnostic.goto_next, bufnr)

  m.noremapBuf('x', '<leader>ca', vim.lsp.buf.range_code_action, bufnr)
  m.noremapBuf('x', '<leader>cf', vim.lsp.buf.range_formatting, bufnr)

  m.noremapBuf('n', '<leader>ca', vim.lsp.buf.code_action, bufnr)
  m.noremapBuf('n', '<leader>cf', vim.lsp.buf.formatting, bufnr)
  m.noremapBuf('n', '<leader>cr', vim.lsp.buf.rename, bufnr)
  m.noremapBuf('n', '<leader>cd', vim.lsp.buf.type_definition, bufnr)

  m.noremapBuf('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufnr)
  m.noremapBuf('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufnr)
  m.noremapBuf('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufnr)

  m.noremapBuf('n', '<space>d', vim.diagnostic.open_float, bufnr)
  m.noremapBuf('n', '<space>q', vim.diagnostic.setloclist, bufnr)

  if client.server_capabilities.document_highlight then
    vim.api.nvim_command("autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()")
    vim.api.nvim_command("autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()")
    vim.api.nvim_command("autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()")
  end
end

local servers = {
  pyright = {},
  -- tsserver = {},
  clangd = {},
  texlab = {},
  -- vuels = {},
  racket_langserver = {},
  rust_analyzer = {
    ['rust-analyzer'] = {
      imports = {
        granularity = {
          group = 'module',
        },
        prefix = 'self',
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true
      },
    }
  },
}
for lsp, settings in pairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = settings
  }
end
