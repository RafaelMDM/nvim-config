return {
	{
		'nvim-treesitter/nvim-treesitter', build = 'TSUpdate' 
	},

	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},

	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},

	{'nvim-treesitter/playground'},
	{'folke/tokyonight.nvim'},
	{'mbbill/undotree'},
	{'tpope/vim-fugitive'},
	{'theprimeagen/harpoon'},
}
