--
-- File: lua/mappings.lua
-- Verison: 21.11.0
--

local wk = require("which-key")

wk.register(
    {
        z = {
            name = "Spelling",
            l = { '<cmd>setlocal spell!<cr>', 'Toggle spelling' },
            i = { '<cmd>setlocal spelllang=it<cr>', 'Enable italian spelling' },
            e = { '<cmd>setlocal spelllang=en<cr>', 'Enable english spelling' },
            d = { '<cmd>setlocal spelllang=de<cr>', 'Enable german spelling' }
        },
        K = {
            function ()
                fts = { 'vim', 'help' }
                if fts[vim.bo.filetype] ~= nil then
                    vim.cmd([[execute 'h '.expand('<cword>')]])
                elseif vim.call('coc#rpc#ready') then
                    vim.fn.CocActionAsync('doHover')
                else
                    vim.cmd([[execute '!' . &keywordprg . " " . expand('<cword>')]])
                end
            end,
            "Show documentation"
        },
        ['[g'] = { '<Plug>(coc-diagnostic-prev)', 'Go to previous diagnostic' },
        [']g'] = { '<Plug>(coc-diagnostic-next)', 'Go to next diagnostic' },
        g = {
            d = { '<plug>(coc-definition)', 'Go to definition' },
            D = { '<plug>(coc-type-definition)', 'Go to type definition' },
            i = { '<plug>(coc-implementation)', 'Go to implementation' },
            r = { '<plug>(coc-references)', 'Go to references' },
        },
        ['<c-s>'] = { '<Plug>(coc-range-select)', 'Range select' },
        ['<c-f>'] = { '<cmd>NvimTreeToggle<cr>', 'Toggle tree view' },
        ['<F2>'] = { '<cmd>tabprevious<cr>', 'Move to previous tab' },
        ['<F3>'] = { '<cmd>tabnext<cr>', 'Move to next tab' },
        ['<F4>'] = { '<cmd>tabclose<cr>', 'Close tab' },
    },
    {
        mode = 'n',
        noremap = true,
        silent = true,
    }
)

wk.register(
    {
        ['<c-a>'] = { '<expr>coc#refresh()', 'Refresh coc.nvim' },
    },
    {
        mode = 'i',
        noremap = true,
        silent = true,
    }
)

wk.register(
    {
        ['<c-s>'] = { '<Plug>(coc-range-select)', 'Range select' },
        ['if'] = { '<Plug>(coc-funcobj-i)', 'Select inner function' },
        ['af'] = { '<Plug>(coc-funcobj-a)', 'Select full function' },
        ['ic'] = { '<Plug>(coc-classobj-i)', 'Select inner class' },
        ['ac'] = { '<Plug>(coc-classobj-a)', 'Select full class' },
    },
    {
        mode = 'x',
        noremap = true,
        silent = true,
    }
)

wk.register(
    {
        ['if'] = { '<Plug>(coc-funcobj-i)', 'Select inner function' },
        ['af'] = { '<Plug>(coc-funcobj-a)', 'Select full function' },
        ['ic'] = { '<Plug>(coc-classobj-i)', 'Select inner class' },
        ['ac'] = { '<Plug>(coc-classobj-a)', 'Select full class' },
    },
    {
        mode = 'o',
        noremap = true,
        silent = true,
    }
)

wk.register(
    {
        j = { '<cmd>BufferPrevious<cr>', 'Previous buffer' },
        k = { '<cmd>BufferNext<cr>', 'Next buffer' },
        J = { '<cmd>BufferMovePrevious<cr>', 'Move previous buffer' },
        K = { '<cmd>BufferMoveNext<cr>', 'Move next buffer' },
        b = {
            c = { '<cmd>BufferClose<cr>', 'Close buffer' },
            p = { '<cmd>BufferPin<cr>', 'Pin buffer' },
            P = { '<cmd>BufferPick<cr>', 'Pick buffer' },
        },
        g = { '<cmd>LazyGit<cr>', 'Open lazygit' },
        T = {
            name = 'Terminal',
            h = { '<cmd>split term://bash<cr>', 'Open terminal' },
            v = { '<cmd>vsplit term://bash<cr>', 'Open terminal' },
        },
        t = { '<cmd>NvimTreeFocus<cr>', 'Focus tree view' },
        c = {
            name = 'Code',
            a = { '<Plug>(coc-codeaction)', 'Code action' },
            A = { '<Plug>(coc-codeaction-selected)', 'Code action selected' },
            f = { '<Plug>(coc-format)', 'Format' },
            F = { '<Plug>(coc-format-selected)', 'Format selected' },
            q = { '<Plug>(coc-fix-current)', 'Quick fix' },
            r = { '<Plug>(coc-rename)', 'Rename' },
        },
        z = {
            name = 'FZF',
            f = { '<cmd>Files<cr>', 'FZF files' },
            F = { '<cmd>GFiles<cr>', 'FZF git files' },
            c = { '<cmd>Commits<cr>', 'FZF commits' },
            b = { '<cmd>Buffers<cr>', 'FZF buffers' },
            w = { '<cmd>Windows<cr>', 'FZF windows' },
            g = { '<cmd>Rg<cr>', 'FZF ripgrep' },
        }
    },
    {
        mode = 'n',
        prefix = '<leader>',
        noremap = true,
        silent = true
    }
)

