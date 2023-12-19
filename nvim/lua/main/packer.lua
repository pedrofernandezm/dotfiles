-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- LSP Support
      {'neovim/nvim-lspconfig'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'L3MON4D3/LuaSnip'},
    }
  }
  use 'preservim/nerdtree'
  use 'ryanoasis/vim-devicons'
  use('tpope/vim-commentary') -- Allows you to comment stuff (5)
  use('tpope/vim-repeat') -- Allows you to repeat supported plugin maps with '.'
  use('tpope/vim-surround') -- Allows you to surround words with brackets, quotes, html tags, among others.
  use('tpope/vim-endwise') -- Allows you to autocomplete chunks of code, adds 'end' in functions, if, etc. (4)
  use('lukas-reineke/indent-blankline.nvim')
end)
