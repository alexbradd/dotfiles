--
-- File: lua/settings.lua
-- Version: 22.10.0
--

local set = vim.opt
local fn = vim.fn
local g = vim.g
local cmd = vim.cmd

set.encoding = 'utf-8'
set.fileencoding = 'utf-8'

set.number = true
set.signcolumn = 'auto:1-2'

set.expandtab = true
set.tabstop = 2
set.softtabstop = -1
set.shiftwidth = 2
set.cc = '81'
set.textwidth = 80
set.listchars = {tab = '▸ ', space = '·'}

set.wrap = false
set.showmatch = true
set.incsearch = true
set.hlsearch = false

set.spelllang = { 'it', 'en' }

set.backup = false -- required by coc.nvim
set.writebackup = false -- required by coc.nvim

set.completeopt = 'menu,menuone,noselect'

set.splitbelow = true
set.splitright = true
set.hidden = true -- required by coc.nvim

set.shortmess:append('c') -- required by coc.nvim

set.mouse = 'nvc'

set.updatetime = 300

-- colorscheme
if fn.has('termguicolors') then
  set.termguicolors = true
end

g.catppuccin_flavour = 'mocha'
require('catppuccin').setup {
  integrations = {
    nvimtree = {
      enabled = true,
      show_root = true,
    },
    indent_blankline = {
      enabled = true,
      color_indent_levels = true,
    },
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
    treesitter = true,
    which_key = true,
    barbar = true,
    markdown = true,
    telescope = true,
    gitsigns = true,
  },
}

if vim.env.TERM ~= 'linux' then
  cmd('colorscheme catppuccin')
else
  set.guicursor = { a = 'ver100' }
  cmd('colorscheme default')
end

-- vim-markdown
g.vim_markdown_folding_disabled = 1
g.vim_markdown_toc_autofit = 1
g.vim_markdown_new_list_item_indent = 2
g.vim_markdown_math = 1
g.tex_conceal = ''
g.vim_markdown_conceal_code_blocks = 0
g.vim_markdown_frontmatter = 1

-- goyo.vim
g.goyo_width = 90
g.goyo_height = 90
