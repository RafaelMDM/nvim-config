local lsp_zero = require('lsp-zero')
local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()
local cmp_format = require('lsp-zero').cmp_format()

require("luasnip.loaders.from_vscode").lazy_load()

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    local opts = { buffer = bufnr }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    if client.name == "eslint" then
        vim.keymap.set("n", "<leader>ff", '<cmd>silent !yarn prettier --write %<CR>', opts)

        local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
        local event = "BufWritePost"
        vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
        vim.api.nvim_create_autocmd(event, {
            buffer = bufnr,
            group = group,
            callback = function()
                vim.cmd(":silent !yarn prettier --write %")
                vim.cmd(":TSLspOrganizeSync")
            end,
            desc = "[lsp] run prettier on save",
        })
    end

    lsp_zero.default_keymaps({ buffer = bufnr })
end)

lsp_zero.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

lsp_zero.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['rust_analyzer'] = { 'rust' },
        ['gopls'] = { 'go' },
        ['clangd'] = { 'cpp' },
    },
})

cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'buffer' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'cmp_tabnine' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    }),
    formatting = cmp_format,
})

vim.filetype.add({ extension = { templ = "templ" } })

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'tsserver',
        'eslint',
        'rust_analyzer',
        'gopls',
        'clangd',
        'wgsl_analyzer',
        'lua_ls',
        'html',
        'htmx',
    },
    handlers = {
        lsp_zero.default_setup,
        rust_analyzer = function()
            local rt = require("rust-tools")
            rt.setup({
                server = {
                    on_attach = function(_, bufnr)
                        vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
                        vim.keymap.set("n", "<leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
                    end,
                    settings = {
                        ["rust-analyzer"] = {
                            cargo = {
                                allFeatures = true,
                                loadOutDirsFromCheck = true,
                                runBuildScripts = true,
                            },
                            -- Add clippy lints for Rust.
                            checkOnSave = {
                                allFeatures = true,
                                command = "clippy",
                                extraArgs = {
                                    "--",
                                    "--no-deps",
                                    "-Dclippy::correctness",
                                    "-Dclippy::complexity",
                                    "-Wclippy::perf",
                                    "-Wclippy::pedantic",
                                },
                            },
                            procMacro = {
                                enable = true,
                                ignored = {
                                    ["async-trait"] = { "async_trait" },
                                    ["napi-derive"] = { "napi" },
                                    ["async-recursion"] = { "async_recursion" },
                                },
                            },
                        },
                    },
                },
            })

            rt.inlay_hints.enable()
        end,
        wgsl_analyzer = function()
            local lspconfig = require('lspconfig')
            lspconfig.wgsl_analyzer.setup()
        end,
    },
})
