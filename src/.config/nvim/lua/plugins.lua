--
-- File: lua/plugins.lua
-- Version: 22.11.0
--

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', install_path
    })
end

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use {
      'catppuccin/nvim',
      as = 'catppuccin',
    }
    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
          require('lualine').setup {
            options = {
              theme = 'catppuccin',
            },
            sections = {
              lualine_a = {'mode'},
              lualine_b = {'branch'},
              lualine_c = {'filename'},
              lualine_x = {
                'encoding',
                { 'fileformat', icons_enabled = false },
                'filetype'
              },
              lualine_y = {'progress'},
              lualine_z = {'location'}
            },
            extensions = { 'quickfix', 'nvim-tree', 'fugitive' }
          }
        end
    }
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require('indent_blankline').setup()
      end
    }
    use {
      'romgrk/barbar.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        vim.g.bufferline = {
          insert_at_end = true,
          no_name_title = "Untitled buffer"
        }
        local nvim_tree_events = require('nvim-tree.events')
        local bufferline_api = require('bufferline.api')

        local function get_tree_size()
          return require'nvim-tree.view'.View.width
        end

        nvim_tree_events.subscribe('TreeOpen', function()
          bufferline_api.set_offset(get_tree_size())
        end)

        nvim_tree_events.subscribe('Resize', function()
          bufferline_api.set_offset(get_tree_size())
        end)

        nvim_tree_events.subscribe('TreeClose', function()
          bufferline_api.set_offset(0)
        end)
      end
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
          require('nvim-tree').setup {
            git = {
              ignore = false
            }
          }
        end
    }
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    }
    use {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make'
    }
    use {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        t = require('telescope')
        t.setup()
        t.load_extension('fzf')
      end
    }

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'neovim/nvim-lspconfig'

    use 'L3MON4D3/LuaSnip'

    use {
      'nvim-treesitter/nvim-treesitter',
      -- run = require('nvim-treesitter.install').update { with_sync = true }
    }
    use 'nvim-treesitter/playground'
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    use 'junegunn/goyo.vim'

    use 'editorconfig/editorconfig-vim'

    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'tpope/vim-fugitive'

    use 'godlygeek/tabular'
    use {
      'plasticboy/vim-markdown',
      ft = 'markdown'
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)

