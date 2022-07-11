vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'

    use {
        'junnplus/nvim-lsp-setup',
        requires = {
            'neovim/nvim-lspconfig',
            'williamboman/nvim-lsp-installer',
        }
    }

	use 'nvim-treesitter/nvim-treesitter'

	use {'dracula/vim', as = 'dracula'}
	use {'fenetikm/falcon'}

	use 'nvim-lua/lsp-status.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'jose-elias-alvarez/nvim-lsp-ts-utils'

	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    use 'lukas-reineke/lsp-format.nvim'

end)
