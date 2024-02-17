return {
	{
		'nvim-treesitter/nvim-treesitter', build = 'TSUpdate' 
	},

	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	'nvim-treesitter/playground',
	'folke/tokyonight.nvim',
	'mbbill/undotree',
	'tpope/vim-fugitive',
	'theprimeagen/harpoon',
}
