return {
    'folke/tokyonight.nvim',
    dependencies = { 'nvim-lualine/lualine.nvim', opt = true },

    config = function()
        require('tokyonight').setup {
            -- style = 'darker',
            transparent = true
        }
        require('tokyonight').load()

        require('lualine').setup {
          options = {
            -- ... your lualine config
            theme = 'tokyonight'
            -- ... your lualine config
          }
        }
    end,
}

