--
-- File: lua/treesitter.lua
-- Verison: 22.09.0
--

require('nvim-treesitter.configs').setup {
  ensure_installed = 'all',
  auto_install = true,
  ignore_install = {},

  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlight = {}
  },
  indent = {
    enable = true
  },
  textobjects = {
    enable = true,
    select = {
      enable = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>cp'] = '@parameter.inner'
      },
      swap_previous = {
        ['<leader>cP'] = '@parameter.inner'
      },
    },
    move = {
      enable = true,
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    }
  },
  playground = {
    enable = true
  }
}

vim.api.nvim_exec([[
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
]], true)
