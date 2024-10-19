return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
        require('lualine').setup({
            options = {
                sections = {
                  lualine_a = {'mode'},
                  lualine_b = {'filename'},
                  lualine_c = {'branch', 'diff', 'diagnostics'},
                  lualine_x = {'encoding', 'fileformat', 'filetype'},
                  lualine_y = {'progress'},
                  lualine_z = {'location'}
                },
                refresh = {
                  statusline = 500,
                  tabline = 2000,
                  winbar = 2000,
                },
            },
        })
    end
}

