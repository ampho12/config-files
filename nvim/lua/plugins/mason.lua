return {
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = { 'clangd' },
            })
        end,
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'williamboman/mason-lspconfig.nvim' },
        config = function()
            local lspconfig = require('lspconfig')
            -- lspconfig.clangd.setup({
            --     cmd = { "clangd", "--background-index" },
            --     filetypes = { "c", "cpp", "objc", "objcpp" },
            --     root_dir = function(fname)
            --         return lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git")(fname) or lspconfig.util.path.dirname(fname)
            --     end,
            --     settings = {
            --         clangd = {
            --             fallbackFlags = { "-std=c++17" },
            --         },
            --     },
            -- })
        end,
    },
}

