return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        filetypes = {
            ["*"] = true,  -- Enable Copilot for all file types
        },
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            open = "<M-CR>",
            refresh = "<C-r>",
            accept = "<C-y>",
            close = "<C-c>",
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<C-a>",
            next = "<C-j>",
            prev = "<C-k>",
            dismiss = "<C-]>",
          },
        },
      })
    end,
  },
  {
    "nvim-lua/plenary.nvim", -- Dependency for Copilot extensions
  },
}


