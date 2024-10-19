return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local actions = require('telescope.actions')

      -- Telescope Setup
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
        defaults = {
          layout_strategy = "bottom_pane",
          layout_config = {
            height = 0.4, -- 40% of the screen height
          },
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-c>"] = actions.close,
            },
          },
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
          },
        },
      })

      -- Keybindings for Telescope built-in functions
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope find git files' })
      vim.keymap.set('n', '<leader>rg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

      -- Load the ui-select extension
      require("telescope").load_extension("ui-select")
    end,
  },

  -- Optional: If you want a Cscope helper plugin
  {
    "dhananjaylatkar/cscope_maps.nvim",
    dependencies = "nvim-telescope/telescope.nvim", -- Optional if you want Telescope
    config = function()
      require('cscope_maps').setup({
        disable_maps = false, -- true disables default key mappings
        skip_input_prompt = false, -- Skip input prompt for search queries
        cscope = {
            picker = "telescope",
        },
      })
      -- Cscope Key Mappings
      vim.keymap.set('n', '<leader>cs', ':Cs find s <C-R>=expand("<cword>")<CR><CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>cg', ':Cs find g <C-R>=expand("<cword>")<CR><CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>cc', ':Cs find c <C-R>=expand("<cword>")<CR><CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>ct', ':Cs find t <C-R>=expand("<cword>")<CR><CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>ce', ':Cs find e <C-R>=expand("<cword>")<CR><CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>cf', ':Cs find f <C-R>=expand("<cfile>")<CR><CR>', { noremap = true, silent = true })

    end
  },
}

