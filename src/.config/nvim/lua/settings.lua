--
-- File: lua/settings.lua
-- Version: 21.11.0
--

local set = vim.opt
local fn = vim.fn
local g = vim.g
local cmd = vim.cmd

set.encoding = 'utf-8'
set.fileencoding = 'utf-8'

set.number = true
set.signcolumn = 'number'

set.expandtab = true
set.tabstop = 4
set.softtabstop = -1
set.shiftwidth = 4
set.cc = '80'
set.textwidth = 80
set.listchars = {tab = '▸ ', space = '·'}
set.list = true

set.wrap = false
set.showmatch = true
set.incsearch = true
set.hlsearch = false

set.spelllang = { 'it', 'en' }

set.backup = false -- required by coc.nvim
set.writebackup = false -- required by coc.nvim

set.splitbelow = true
set.splitright = true
set.hidden = true -- required by coc.nvim

set.shortmess:append('c') -- required by coc.nvim

set.mouse = 'nvc'

set.cmdheight = 2
set.updatetime = 300

-- colorscheme
if fn.has('termguicolors') then
    set.termguicolors = true
end

require('catppuccino').setup({
    colorscheme = 'soft_manilo',
    styles = {
        comments = 'italic',
        functions = 'NONE',
        keywords = 'NONE',
        variables = 'NONE',
        strings = 'italic',
    },
    integration = {
        nvimtree = {
            enabled = true,
            show_root = true,
        },
        indent_blankline = {
            enabled = true,
            color_indent_levels = true,
        },
    },
})

if vim.env.TERM ~= 'linux' then
    cmd('colorscheme catppuccino')
else
    set.guicursor = { a = 'ver100' }
    cmd('colorscheme default')
end

-- lualine
require('lualine').setup({
    options = {
        theme = 'catppuccino',
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {
            'coc#status',
            'encoding',
            { 'fileformat', icons_enabled = false },
            'filetype'
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    extensions = { 'quickfix', 'nvim-tree', 'fzf', 'fugitive' }
})

-- vim-markdown
g.vim_markdown_folding_disabled = 1
g.vim_markdown_toc_autofit = 1
g.vim_markdown_new_list_item_indent = 2
g.vim_markdown_math = 1
g.tex_conceal = ''
g.vim_markdown_conceal_code_blocks = 0
g.vim_markdown_frontmatter = 1

-- coc.nvim
g.coc_snippet_next = '<C-j>'
g.coc_snippet_prev = '<C-k>'

-- barbar.nvim

-- indent-blankline.nvim
require('indent_blankline').setup()

-- which-key.nvim
require('which-key').setup()

-- Comment.nvim
require('Comment').setup()

-- nvim-tree
require('nvim-tree').setup()

