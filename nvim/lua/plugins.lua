vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	use({
		"junnplus/lsp-setup.nvim",
		requires = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
	})
	use("lukas-reineke/lsp-format.nvim")
	use("onsails/lspkind.nvim")

	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-nvim-lsp-document-symbol")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")

	use({ 'nvim-treesitter/nvim-treesitter' }, { run = ':TSUpdate' })
	use 'nvim-lua/lsp-status.nvim'
	use 'sbdchd/neoformat'

	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use({
		"epwalsh/obsidian.nvim",
		{ tag = "v1.*" },
	})

	use({
		"ThePrimeagen/harpoon",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	use { 'mfussenegger/nvim-dap' }
	use { 'rcarriga/nvim-dap-ui' }
	use { 'mfussenegger/nvim-dap-python' }
	use { 'theHamsta/nvim-dap-virtual-text' }
	use { 'nvim-telescope/telescope-dap.nvim' }

	use { 'terrortylor/nvim-comment' }
	use({
		'kylechui/nvim-surround',
		config = function()
			require("nvim-surround").setup({})
		end
	})

	use({ "terrortylor/nvim-comment" })
	use({
		"kylechui/nvim-surround",
		tag = "*",
		config = function()
			require("nvim-surround").setup({})
		end,
	})

	use({
		"TimUntersberger/neogit",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	use({ "lewis6991/gitsigns.nvim" })

	use { 'dracula/vim', as = 'dracula' }
	use { 'fenetikm/falcon' }
	use { "ellisonleao/gruvbox.nvim" }
	use { "savq/melange" }
	use { "folke/tokyonight.nvim" }
	use { "EdenEast/nightfox.nvim" }
	use {
		'rmagatti/goto-preview',
		config = function()
			require('goto-preview').setup {}
		end
	}
	use { "luisiacc/gruvbox-baby" }
end)
