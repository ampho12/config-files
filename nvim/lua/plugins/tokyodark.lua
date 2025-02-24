return {
    'tiagovla/tokyodark.nvim',
    dependencies = { 'nvim-lualine/lualine.nvim', opt = true },

    config = function()
        require('tokyodark').setup {
            transparent_background = true, -- Enable transparency
            gamma = 1.0, -- Adjust gamma correction (default 1.0)
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
                identifiers = { italic = false },
                functions = {},
                variables = {},
            }
        }
        vim.cmd [[colorscheme tokyodark]] -- Load the theme

        require('lualine').setup {
            options = {
                theme = 'tokyodark'
            }
        }
    end,
}

