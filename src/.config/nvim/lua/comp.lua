--
-- File: lua/cmp.lua
-- Version: 22.09.0
--

local cmp = require('cmp')
local snip = require('luasnip')

cmp.setup {
  snippet = {
    expand = function(args)
      snip.lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' }
  }
}
