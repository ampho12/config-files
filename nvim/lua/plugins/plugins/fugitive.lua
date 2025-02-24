return {
  -- vim-fugitive plugin configuration
  {
    'tpope/vim-fugitive', -- Plugin name
    config = function()
      -- Set Fugitive key mappings
      vim.api.nvim_set_keymap('n', '<Leader>gs', ':Git<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>gc', ':Git commit<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>gp', ':Git push<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>gl', ':Git pull<CR>', { noremap = true, silent = true })
      
      -- Optional: Show git blame inline
      vim.api.nvim_set_keymap('n', '<Leader>gb', ':Git blame<CR>', { noremap = true, silent = true })
      
      -- Optional: Custom commands and enhancements for Fugitive
      vim.api.nvim_set_keymap('n', '<Leader>gd', ':Gdiffsplit<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>gr', ':Gread<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>gw', ':Gwrite<CR>', { noremap = true, silent = true })
    end,
    event = 'VeryLazy', -- Lazy load Fugitive when an event occurs
  }
}

