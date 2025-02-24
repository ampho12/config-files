return {
    'aserowy/tmux.nvim',
    config = function()
        require('tmux').setup({
            navigation = {
                cycle_navigation = false,
                enable_default_keybindings = false,
                persist_zoom = false,
            },
            resize = {
                enable_default_keybindings = false,
                resize_step_x = 1,
                resize_step_y = 1,
            }
        })

        local tmux = require('tmux')
        local opts = { noremap = true, silent = true }

        -- Assign tmux functions to local variables
        local move_left = tmux.move_left
        local move_bottom = tmux.move_bottom
        local move_top = tmux.move_top
        local move_right = tmux.move_right
        local resize_left = tmux.resize_left
        local resize_bottom = tmux.resize_bottom
        local resize_top = tmux.resize_top
        local resize_right = tmux.resize_right

        -- Navigation key mappings
        vim.keymap.set('n', '<M-h>', move_left, opts)
        vim.keymap.set('n', '<M-j>', move_bottom, opts)
        vim.keymap.set('n', '<M-k>', move_top, opts)
        vim.keymap.set('n', '<M-l>', move_right, opts)
        vim.keymap.set('t', '<M-h>', move_left, opts)
        vim.keymap.set('t', '<M-j>', move_bottom, opts)
        vim.keymap.set('t', '<M-k>', move_top, opts)
        vim.keymap.set('t', '<M-l>', move_right, opts)

        -- Resizing key mappings
        vim.keymap.set('n', '<M-H>', resize_left, opts)
        vim.keymap.set('n', '<M-J>', resize_bottom, opts)
        vim.keymap.set('n', '<M-K>', resize_top, opts)
        vim.keymap.set('n', '<M-L>', resize_right, opts)
        vim.keymap.set('t', '<M-H>', resize_left, opts)
        vim.keymap.set('t', '<M-J>', resize_bottom, opts)
        vim.keymap.set('t', '<M-K>', resize_top, opts)
        vim.keymap.set('t', '<M-L>', resize_right, opts)
    end
}

