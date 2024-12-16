return {
  { 'lewis6991/gitsigns.nvim', config = true },

  -- {'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async', lazy = true }, -- Fix fold issues

  {'nvim-treesitter/playground', cmd = "TSPlaygroundToggle" },

  { "folke/trouble.nvim", dependencies = 'kyazdani42/nvim-web-devicons', config = true },

  {
    "folke/zen-mode.nvim",
    lazy = true,
    cmd = "ZenMode",
    opts = {
      plugins = {
        tmux = { enabled = true }
      }
    }
  },

  {
    "gaoDean/autolist.nvim",
    ft = { "markdown", "text", },
    config = function()
      local autolist = require("autolist")
      autolist.setup()
        vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>")
        vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>")
        vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>")
        vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>")
        vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>")
        vim.keymap.set("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>")
        vim.keymap.set("n", "<C-r>", "<cmd>AutolistRecalculate<cr>")

        -- cycle list types with dot-repeat
        vim.keymap.set("n", "<leader>cn", require("autolist").cycle_next_dr, { expr = true })
        vim.keymap.set("n", "<leader>cp", require("autolist").cycle_prev_dr, { expr = true })

        -- functions to recalculate list on edit
        vim.keymap.set("n", ">>", ">><cmd>AutolistRecalculate<cr>")
        vim.keymap.set("n", "<<", "<<<cmd>AutolistRecalculate<cr>")
        vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<cr>")
        vim.keymap.set("v", "d", "d<cmd>AutolistRecalculate<cr>")
    end,
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown' },
    opts = {
      heading = {
        enabled = true,
        sign = false,
        position = 'inline',
        backgrounds = {
          'Headline1',
          'Headline2',
          'Headline3',
          'Headline4',
          'Headline5',
          'Headline6',
          -- 'RenderMarkdownH1Bg',
          -- 'RenderMarkdownH2Bg',
          -- 'RenderMarkdownH3Bg',
          -- 'RenderMarkdownH4Bg',
          -- 'RenderMarkdownH5Bg',
          -- 'RenderMarkdownH6Bg',
        },
      }
    },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
  },

  'folke/tokyonight.nvim',

  -- {
  --   'shaunsingh/nord.nvim',
  --   config = function()
  --     vim.g.nord_borders = true
  --     vim.g.nord_italic = false
  --     vim.g.nord_bold = false
  --
  --     require('nord').set()
  --     local colors = require('nord.colors')
  --
  --     -- Fix highlights
  --     vim.api.nvim_set_hl(0, "QuickfixLine", { link = "CursorLine" })
  --     vim.api.nvim_set_hl(0, "qFLineNr", { link = "CursorLine" })
  --     vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "NONE", bg = "NONE" })
  --     vim.api.nvim_set_hl(0, "MiniJump", { fg = colors.nord0_gui, bg = colors.nord8_gui })
  --
  --     vim.cmd("hi Headline1 guibg=NONE")
  --     vim.cmd("hi Headline2 guibg=NONE")
  --     vim.cmd("hi Headline3 guibg=NONE")
  --     vim.cmd("hi Headline4 guibg=NONE")
  --     vim.cmd("hi Headline5 guibg=NONE")
  --   end
  -- },

  -- Mini
  {
    'echasnovski/mini.nvim',
    branch = 'stable',
    config = function()
      require('mini.comment').setup()
      require('mini.indentscope').setup({
        symbol = "│",
        options = { indent_at_cursor = false, try_as_border = true },
      })
      require('mini.surround').setup()
    end
  },

  {
    "akinsho/toggleterm.nvim",
    version = '*',
    config = true,
    cmd = { "ToggleTerm", "TermExec" },
    keys = ",t",
    opts = {
      terminal_mappings = true,
      open_mapping = ',t',
      direction = 'float',
    }
  },

  { 'steve21168/command-pat.nvim' },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      panel = {
        enabled = false,
      },
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<C-a>",
          accept_word = "<C-w>",
          accept_line = false,
          next = "<C-j>",
          prev = "<C-k>",
          dismiss = "<C-d>"
        },
      }
    }
  },

  {
    "olimorris/codecompanion.nvim",
    cmd = { 'CodeCompanion', 'CodeCompanionChat' },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp", -- Optional: For activating slash commands and variables in the chat buffer
      "nvim-telescope/telescope.nvim", -- Optional: For working with files with slash commands
      {
        "stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
        opts = {},
      },
    },
    opts = {
      strategies = {
        chat = { adapter = "copilot" },
        inline = { adapter = "copilot" },
        agent = { adapter = "copilot" },
      },
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
      routes = {
        {
          view = "notify",
          filter = { event = "msg_showmode" },
        }
      }
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },

  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
  },

  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    opts = {
      outline_window  = {
        position = "left",
      }
    }
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      local flavor = "frappe" -- latte, frappe, macchiato, mocha
      local base_color = require("catppuccin.palettes").get_palette(flavor).base
      require("catppuccin").setup({
        flavour = flavor,
        color_overrides = {
          all = {
            mantle = base_color,
          }
        }
      })

      vim.cmd.colorscheme "catppuccin"
    end
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    event = "BufEnter",
    opts = {
      git_services = {
        ["github.medallia.com"] = "https://github.medallia.com/${owner}/${repository}/compare/${branch_name}?expand=1",
      }
    }
  },

  {
    "sindrets/diffview.nvim",
    lazy = true,
    config = {
      keymaps = {
        view = {
          { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close" } },
        },
        file_panel = {
          { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close" } },
        }
      }
    }
  },

  -- Standard Vim Plugins
  'tpope/vim-fugitive',

  'christoomey/vim-tmux-navigator',

  {
    'ntpeters/vim-better-whitespace',
    config = function()
      vim.g.better_whitespace_filetypes_blacklist= { 'toggleterm' }
    end
  },

  'milkypostman/vim-togglelist',

  { 'andymass/vim-matchup', event = "BufReadPost" },

  { 'kana/vim-textobj-line', dependencies = 'kana/vim-textobj-user' },

  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    cmd = "MarkdownPreview",
    build = function()
      vim.fn["mkdp#util#install"]()
    end
  },
}
