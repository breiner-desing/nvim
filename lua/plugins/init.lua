local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Optional, for file icons
  use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.x', requires = { { 'nvim-lua/plenary.nvim' } } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'folke/tokyonight.nvim'
  use { "nvim-treesitter/nvim-treesitter", run = ':TSUpdate' }

  -- LSPs
  use {
    "williamboman/mason.nvim"
  }
  use 'mfussenegger/nvim-jdtls'
  use 'neovim/nvim-lspconfig'
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  -- Git
  -- use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use 'lewis6991/gitsigns.nvim'

  -- Debug
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/cmp-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'nvim-neotest/nvim-nio'

  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use "lukas-reineke/indent-blankline.nvim"
  use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }
  use 'j-hui/fidget.nvim'

  if packer_bootstrap then require("packer").sync() end
end)


-- Load plugin configurations
require('plugins.bufferline')
require('plugins.fidget')
require('plugins.gitsigns')
require('plugins.lualine')
require('plugins.mason')
require('plugins.nvim-tree')
require('plugins.telescope')

