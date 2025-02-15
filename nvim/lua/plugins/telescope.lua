return {
  {
    "nvim-telescope/telescope-ui-select.nvim",

  },
  {
      'stevearc/aerial.nvim',
      opts = {
          on_attach = function(bufnr)
          end,
      },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { 
        "nvim-lua/plenary.nvim",
        "stevearc/aerial.nvim",
    },
    config = function()
      local actions = require('telescope.actions')

      -- Telescope Setup
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
          aerial = {
              -- Set the width of the first two columns (the second
              -- is relevant only when show_columns is set to 'both')
              col1_width = 4,
              col2_width = 30,
              -- How to format the symbols
              format_symbol = function(symbol_path, filetype)
                  if filetype == "json" or filetype == "yaml" then
                      return table.concat(symbol_path, ".")
                  else
                      return symbol_path[#symbol_path]
                  end
              end,
              -- Available modes: symbols, lines, both
              show_columns = "both",
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
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("aerial")


      -- Keybindings for Telescope built-in functions
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope find git files' })
      vim.keymap.set('n', '<leader>rg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      vim.keymap.set('n', '<leader>fa', "<cmd>Telescope aerial<CR>", { desc = 'Telescope aerial' })

      -- Load the ui-select extension
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
    {
        "debugloop/telescope-undo.nvim",
        dependencies = { -- note how they're inverted to above example
            {
                "nvim-telescope/telescope.nvim",
                dependencies = { "nvim-lua/plenary.nvim" },
            },
        },
        keys = {
            { -- lazy style key map
                "<leader>u",
                "<cmd>Telescope undo<cr>",
                desc = "undo history",
            },
        },
        opts = {
            -- don't use `defaults = { }` here, do this in the main telescope spec
            extensions = {
                undo = {
                    -- telescope-undo.nvim config, see below
                },
                -- no other extensions here, they can have their own spec too
            },
        },
        config = function(_, opts)
            -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
            -- configs for us. We won't use data, as everything is in it's own namespace (telescope
            -- defaults, as well as each extension).
            require("telescope").setup(opts)
            require("telescope").load_extension("undo")
        end,
    },
}

