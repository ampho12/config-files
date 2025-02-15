-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    -- {
    --     "neovim/nvim-lspconfig",
    --     lazy = false,
    --     config = function()
    --         -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    --         -- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    --         local lspconfig = require("lspconfig")
    --         lspconfig.rust_analyzer.setup({
    --             settings = {
    --                 ["rust-analyzer"] = {
    --                     cargo = { allFeatures = true },
    --                     procMacro = { enable = true },
    --                     checkOnSave = {
    --                         command = "clippy",
    --                     },
    --                 },
    --             },
    --         })

    --         -- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    --         -- vim.keymap.set("n", "<leader>fd", vim.lsp.buf.definition, {})
    --         -- vim.keymap.set("n", "<leader>fr", vim.lsp.buf.references, {})
    --         -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    --     end,
    -- },
    spec = {
      -- import your plugins
      { import = "plugins" },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    -- install = { colorscheme = { "tokyonight" } },
    -- automatically check for plugin updates
    -- checker = { enabled = false },
})
