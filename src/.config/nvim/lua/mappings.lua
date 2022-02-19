--
-- File: lua/mappings.lua
-- Verison: 22.02.0
--

local wk = require("which-key")

wk.register(
    {
        z = {
            name = "Spelling",
            l = { '<cmd>setlocal spell!<cr>', 'Toggle spelling' },
        },
        K = {
            function ()
                ft = vim.bo.filetype
                if ft == 'vim' or ft == 'help' then
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
            name = "Go to",
            b = { '<cmd>BufferPick<cr>', 'Go to buffer' },
            d = { '<plug>(coc-definition)', 'Go to definition' },
            D = { '<plug>(coc-type-definition)', 'Go to type definition' },
            i = { '<plug>(coc-implementation)', 'Go to implementation' },
            r = { '<plug>(coc-references)', 'Go to references' },
        },
        ['<c-s>'] = { '<Plug>(coc-range-select)', 'Range select' },
        ['<c-f>'] = { function()
            local tree = require('nvim-tree')
            local view = require('nvim-tree.view')
            local bufferline = require('bufferline.state')

            if view.win_open() then
              tree.toggle()
              bufferline.set_offset(0)
            else
              bufferline.set_offset(30, 'FileTree')
              tree.toggle()
            end
          end,
          'Toggle tree view'
        },
        ['<M-f>'] = { '<cmd>NvimTreeFocus<cr>', 'Focus tree view' },
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
        ['<leader>c'] = {
            name = 'Code actions',
            a = { '<Plug>(coc-codeaction-selected)', 'Code action selected' },
            f = { '<Plug>(coc-format-selected)', 'Format selected' },
        },
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
        h = { '<cmd>BufferPrevious<cr>', 'Previous buffer' },
        l = { '<cmd>BufferNext<cr>', 'Next buffer' },
        H = { '<cmd>BufferMovePrevious<cr>', 'Move previous buffer' },
        L = { '<cmd>BufferMoveNext<cr>', 'Move next buffer' },
        q = { '<cmd>BufferClose<cr>', 'Close buffer' },
        p = { '<cmd>BufferPin<cr>', 'Pin buffer' },
        g = {
            name = 'Fugitive',
            g = { '<cmd>Git<cr>', 'Open fugitive' },
            b = { '<cmd>Git blame<cr>', 'Open fugitive blame on file' },
            l = { '<cmd>Git --paginate slog<cr>', 'Open fugitive log' },
        },
        t = {
            name = 'Terminal',
            t = { '<cmd>e term://bash<cr>', 'Open terminal' },
            h = { '<cmd>split term://bash<cr>', 'Open terminal in horizontal split' },
            v = { '<cmd>vsplit term://bash<cr>', 'Open terminal in vertical split' },
        },
        c = {
            name = 'Code',
            d = { '<cmd>CocList diagnostics<cr>', 'Diagnostics' },
            a = { '<Plug>(coc-codeaction)', 'Code action' },
            l = { '<Plug>(coc-codelens-action)', 'Code lens' },
            f = { '<Plug>(coc-format)', 'Format' },
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

