return {
    {
        'nvim-treesitter/nvim-treesitter', build = 'TSUpdate'
    },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip',                 dependencies = { 'rafamadriz/friendly-snippets', 'honza/vim-snippets' } },
    { 'saadparwaiz1/cmp_luasnip' },
    {
        'tzachar/cmp-tabnine',
        build = './install.sh',
        dependencies = 'hrsh7th/nvim-cmp',
    },

    { 'nvim-treesitter/playground' },
    { 'mbbill/undotree' },
    { 'tpope/vim-fugitive' },
    { 'theprimeagen/harpoon' },

    { 'folke/tokyonight.nvim' },
    { 'Shatur/neovim-ayu' },
}
