local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


return require('packer').startup(function(use)

	use  'wbthomason/packer.nvim'

	--optional, for file icons
 	use {	'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' }, tag = 'nightly'	}

	use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

	--tag = '0.1.1' or branch = '0.1.x'
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = { {'nvim-lua/plenary.nvim'} } }

  use 'folke/tokyonight.nvim'
  
	use { 'lewis6991/gitsigns.nvim' }





	--use { "nvim-treesitter/nvim-treesitter", run = ':TSUpdate' }
  
	--Autocomplate
--	use {'neoclide/coc.nvim', branch = 'release' }

	use "williamboman/mason.nvim"

	use 'mfussenegger/nvim-jdtls'

  use 'neovim/nvim-lspconfig'

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- Soporte LSP
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletado
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

--	use 'neovim/nvim-lspconfig'

	if packer_bootstrap then require("packer").sync() end


end)
