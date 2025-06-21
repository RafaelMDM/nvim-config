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

    { 'VonHeikemen/lsp-zero.nvim',           branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'simrat39/rust-tools.nvim' },
    { 'jose-elias-alvarez/nvim-lsp-ts-utils' },
    { 'L3MON4D3/LuaSnip',                    dependencies = { 'rafamadriz/friendly-snippets', 'honza/vim-snippets' } },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'nanotee/sqls.nvim' },
    {
        'tzachar/cmp-tabnine',
        build = './install.sh',
        dependencies = 'hrsh7th/nvim-cmp',
    },
    {
        'saecki/crates.nvim',
        tag = 'stable',
        config = function()
            require('crates').setup()
        end,
    },
    {
        "adalessa/laravel.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "tpope/vim-dotenv",
            "MunifTanjim/nui.nvim",
            "kevinhwang91/promise-async",
            "nvimtools/none-ls.nvim",
        },
        cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
        keys = {
            { "<leader>la", ":Laravel artisan<cr>" },
            { "<leader>lr", ":Laravel routes<cr>" },
            { "<leader>lm", ":Laravel related<cr>" },
        },
        event = { "VeryLazy" },
        config = true,
        opts = {
            lsp_server = "intelephense",
            features = { null_ls = { enable = false } },
        },
    },
    {
        -- Add the blade-nav.nvim plugin which provides Goto File capabilities
        -- for Blade files.
        "ricardoramirezr/blade-nav.nvim",
        dependencies = {
            "hrsh7th/nvim-cmp",
        },
        ft = { "blade", "php" },
    },

    { 'nvim-treesitter/playground' },
    { 'mbbill/undotree' },
    { 'tpope/vim-fugitive' },
    { 'theprimeagen/harpoon' },
    { 'm4xshen/autoclose.nvim' },
    { 'christoomey/vim-tmux-navigator' },

    --    { 'folke/tokyonight.nvim' },
    { 'Shatur/neovim-ayu' },
}
