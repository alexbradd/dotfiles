--
-- File: lua/plugins.lua
-- Version: 21.11.0
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
    use('wbthomason/packer.nvim')

    use('Pocco81/Catppuccino.nvim')
    use({
        'hoob3rt/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    })
    use({
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
    })
    use({
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    })
    use('folke/which-key.nvim')

    use('numToStr/Comment.nvim')
    use('tpope/vim-surround')
    use('tpope/vim-repeat')
    use('godlygeek/tabular')

    use('sheerun/vim-polyglot')
    use('kdheepak/lazygit.nvim')
    use('junegunn/fzf.vim')
    use({
        'neoclide/coc.nvim',
        branch = 'master',
        run = 'yarn install --frozen-lockfile'
    })

    if packer_bootstrap then
        require('packer').sync()
    end
end)

