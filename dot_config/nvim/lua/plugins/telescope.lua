return {
  'nvim-telescope/telescope.nvim',
  version = '0.1.5',
  dependencies = {
    {'nvim-lua/plenary.nvim'},
    { "nvim-telescope/telescope-live-grep-args.nvim" },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    local telescope = require("telescope")
    local lga_actions = require("telescope-live-grep-args.actions")
    local actions = require("telescope.actions")
    local custom_functions = require('user/custom_functions')

    telescope.setup {
      defaults = {
        mappings = {
          i = {
            ["<C-h>"] = "which_key",
            ['<C-n>'] = actions.cycle_history_next,
            ['<C-p>'] = actions.cycle_history_prev,
            ['<C-d>'] = actions.delete_buffer,
            ['<C-g>'] = custom_functions.downward_grep
          },
          n = {
            ['<C-g>'] = custom_functions.downward_grep,
          }
        },
        preview = {
          treesitter = false,
        }
      },
      extensions = {
        live_grep_args = {
          auto_quoting = true,
          mappings = {
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
            },
            n = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
            }
          }
        }
      }
    }

    telescope.load_extension("live_grep_args")
    telescope.load_extension("fzf")
  end
}
