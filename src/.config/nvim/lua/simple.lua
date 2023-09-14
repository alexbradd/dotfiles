local set = vim.opt

vim.cmd("colorscheme default")

set.relativenumber = false
set.number = true

set.wrap = false

set.encoding = "utf-8"
set.fileencoding = "utf-8"

set.expandtab = true
set.tabstop = 2
set.softtabstop = -1
set.shiftwidth = 2
set.cc = "81"
set.listchars = { tab = "▸ ", space = "·" }

set.ignorecase = false

set.mouse = ""
set.list = false

set.spelllang = { "it", "en" }

vim.g.editorconfig = true

if vim.env.TERM == "linux" then
  set.guicursor = { a = "ver100" }
end
