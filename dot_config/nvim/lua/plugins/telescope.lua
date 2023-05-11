return {
  'nvim-telescope/telescope.nvim',
  version = '0.1.0',
  dependencies = { {'nvim-lua/plenary.nvim'}, { "nvim-telescope/telescope-live-grep-args.nvim" }, },
  config = function()
    local telescope = require("telescope")
    local lga_actions = require("telescope-live-grep-args.actions")
    local actions = require("telescope.actions")

    telescope.setup {
      defaults = {
        mappings = {
          i = {
            ["<C-h>"] = "which_key",
            ['<C-n>'] = actions.cycle_history_next,
            ['<C-p>'] = actions.cycle_history_prev,
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
          }
        }
      }
    }

    telescope.load_extension("live_grep_args")
  end
}
