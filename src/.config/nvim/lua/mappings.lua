--
-- File: lua/mappings.lua
-- Verison: 22.10.0
--

local m = require('mapfn')

m.noremap('n', 'zl', '<cmd>setlocal spell!<cr>')
m.noremap('n', 'gb', '<cmd>BufferPick<cr>')
m.noremap('n', '<c-f>', '<cmd>NvimTreeToggle<cr>')
m.noremap('n', '<M-f>', '<cmd>NvimTreeFocus<cr>')
m.noremap('n', '<F2>', '<cmd>tabprevious<cr>')
m.noremap('n', '<F3>', '<cmd>tabnext<cr>')
m.noremap('n', '<F4>', '<cmd>tabclose<cr>')

m.noremap('n', '<leader>h', '<cmd>BufferPrevious<cr>')
m.noremap('n', '<leader>l', '<cmd>BufferNext<cr>')
m.noremap('n', '<leader>H', '<cmd>BufferMovePrevious<cr>')
m.noremap('n', '<leader>L', '<cmd>BufferMoveNext<cr>')
m.noremap('n', '<leader>q', '<cmd>BufferClose<cr>')
m.noremap('n', '<leader>p', '<cmd>BufferPin<cr>')
m.noremap('n', '<leader>gg', '<cmd>Git<cr>')
m.noremap('n', '<leader>gb', '<cmd>Git blame<cr>')
m.noremap('n', '<leader>gl', '<cmd>Git --paginate slog<cr>')
m.noremap('n', '<leader>gy', '<cmd>Goyo<cr>')
m.noremap('n', '<leader>tt', '<cmd>e term://bash<cr>')
m.noremap('n', '<leader>th', '<cmd>split term://bash<cr>')
m.noremap('n', '<leader>tv', '<cmd>vsplit term://bash<cr>')
m.noremap('n', '<leader>zf', '<cmd>Telescope find_files<cr>')
m.noremap('n', '<leader>zF', '<cmd>Telescope git_files<cr>')
m.noremap('n', '<leader>zc', '<cmd>Telescope git_commits<cr>')
m.noremap('n', '<leader>zb', '<cmd>Telescope buffers<cr>')
m.noremap('n', '<leader>zg', '<cmd>Telescope grep_string<cr>')
m.noremap('n', '<leader>zk', '<cmd>Telescope keymaps<cr>')
m.noremap('n', '<leader>zd', '<cmd>Telescope diagnostics<cr>')

-- wk.register(
--     {
--         ['<c-s>'] = { '<Plug>(coc-range-select)', 'Range select' },
--         ['if'] = { '<Plug>(coc-funcobj-i)', 'Select inner function' },
--         ['af'] = { '<Plug>(coc-funcobj-a)', 'Select full function' },
--         ['ic'] = { '<Plug>(coc-classobj-i)', 'Select inner class' },
--         ['ac'] = { '<Plug>(coc-classobj-a)', 'Select full class' },
--     },
--     {
--         mode = 'x',
--         noremap = true,
--         silent = true,
--     }
-- )

-- wk.register(
--     {
--         ['if'] = { '<Plug>(coc-funcobj-i)', 'Select inner function' },
--         ['af'] = { '<Plug>(coc-funcobj-a)', 'Select full function' },
--         ['ic'] = { '<Plug>(coc-classobj-i)', 'Select inner class' },
--         ['ac'] = { '<Plug>(coc-classobj-a)', 'Select full class' },
--     },
--     {
--         mode = 'o',
--         noremap = true,
--         silent = true,
--     }
-- )
