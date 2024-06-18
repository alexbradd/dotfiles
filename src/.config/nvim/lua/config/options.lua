-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local set = vim.opt

set.relativenumber = false
set.number = true

set.wrap = false

set.encoding = "utf-8"
set.fileencoding = "utf-8"

set.expandtab = true
set.tabstop = 2
set.softtabstop = -1
set.shiftwidth = 2
set.cc = { "81", "121" }
set.listchars = { tab = "▸ ", space = "·" }

set.ignorecase = false

set.list = false

set.spelllang = { "it", "en" }

vim.g.editorconfig = true

vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_toc_autofit = 1
vim.g.vim_markdown_new_list_item_indent = 2
vim.g.vim_markdown_math = 1
vim.g.tex_conceal = ""
vim.g.vim_markdown_conceal_code_blocks = 0
vim.g.vim_markdown_frontmatter = 1
