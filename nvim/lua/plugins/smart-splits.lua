return {
  "mrjones2014/smart-splits.nvim",
  -- event = "VeryLazy", -- Load plugin lazily after startup
  -- opts = {
  --   at_edge = "mux",
  -- },
  -- opts = {
  --   -- Directional keys for movement and resizing
  --   direction_keys = {
  --     move = { "h", "j", "k", "l" },
  --     resize = { "<Left>", "<Down>", "<Up>", "<Right>" },
  --   },

  --   -- Modifier keys for movement and resize
  --   modifiers = {
  --     move = "C", -- CTRL + h/j/k/l to move between splits
  --     resize = "M", -- META + Arrow keys to resize splits
  --   },

  --   -- Integrate with WezTerm for seamless pane navigation
  --   multiplexer_integration = "wezterm",

  --   -- Logging level (info, warn, error)
  --   log_level = "info",
  -- },

  -- Define all keybindings
  keys = function()
    local smart_splits = require("smart-splits")

    -- Movement
    vim.keymap.set("n", "<M-h>", smart_splits.move_cursor_left, { desc = "Move left" })
    vim.keymap.set("n", "<M-j>", smart_splits.move_cursor_down, { desc = "Move down" })
    vim.keymap.set("n", "<M-k>", smart_splits.move_cursor_up, { desc = "Move up" })
    vim.keymap.set("n", "<M-l>", smart_splits.move_cursor_right, { desc = "Move right" })

    -- Resize
    vim.keymap.set("n", "<M-H>", smart_splits.resize_left, { desc = "Resize left" })
    vim.keymap.set("n", "<M-J>", smart_splits.resize_down, { desc = "Resize down" })
    vim.keymap.set("n", "<M-K>", smart_splits.resize_up, { desc = "Resize up" })
    vim.keymap.set("n", "<M-L>", smart_splits.resize_right, { desc = "Resize right" })
  end,
}

