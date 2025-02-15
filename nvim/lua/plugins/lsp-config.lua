return {
    {
        "neovim/nvim-lspconfig",
        dependencies = "nvim-telescope/telescope.nvim",
        lazy = false,
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            -- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

            local lspconfig = require("lspconfig")
            lspconfig.rust_analyzer.setup({
                settings = {
                    ["rust-analyzer"] = {
                        cargo = { allFeatures = true },
                        procMacro = { enable = true },
                        checkOnSave = {
                            command = "clippy",
                        },
                        diagnostics = {
                            refreshSupport = false,
                        } 
                    },
                },
                capabilties = capabilties,
                commands = {
                    ExpandMacro = {
                        function()
                            vim.lsp.buf_request_all(0, "rust-analyzer/expandMacro", vim.lsp.util.make_position_params(), vim.print)
                        end,
                    },
                },
            })
            -- Import Telescope's built-in functions
            local builtin = require("telescope.builtin")

            -- Keybindings for Telescope LSP features
            vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Find References", noremap = true, silent = true })
            vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "Go to Definition", noremap = true, silent = true })
            vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, { desc = "Find Implementations", noremap = true, silent = true })
            vim.keymap.set("n", "<leader>ft", builtin.lsp_type_definitions, { desc = "Go to Type Definition", noremap = true, silent = true })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions", noremap = true, silent = true })
            vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "Document Symbols", noremap = true, silent = true })
            vim.keymap.set("n", "<leader>ws", builtin.lsp_workspace_symbols, { desc = "Workspace Symbols", noremap = true, silent = true })
            vim.keymap.set("n", "<leader>di", builtin.diagnostics, { desc = "Workspace Diagnostics", noremap = true, silent = true })
            vim.keymap.set("n", "<leader>od", vim.diagnostic.open_float, { desc = "Workspace Diagnostics", noremap = true, silent = true })
        end
    },
}
