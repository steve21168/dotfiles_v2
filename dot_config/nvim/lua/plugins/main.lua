return {
  { 'lewis6991/gitsigns.nvim', config = true },

  {'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async', lazy = true }, -- Fix fold issues

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

        -- if you don't want dot-repeat
        -- vim.keymap.set("n", "<leader>cn", "<cmd>AutolistCycleNext<cr>")
        -- vim.keymap.set("n", "<leader>cp", "<cmd>AutolistCycleNext<cr>")

        -- functions to recalculate list on edit
        vim.keymap.set("n", ">>", ">><cmd>AutolistRecalculate<cr>")
        vim.keymap.set("n", "<<", "<<<cmd>AutolistRecalculate<cr>")
        vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<cr>")
        vim.keymap.set("v", "d", "d<cmd>AutolistRecalculate<cr>")
    end,
  },

  {
    'lukas-reineke/headlines.nvim',
    dependencies = 'nvim-treesitter',
    ft = { 'org', 'markdown' },
    config = true,
    opts = {
      markdown = {
        headline_highlights = {
          'Headline1',
          'Headline2',
          'Headline3',
          'Headline4',
          'Headline5',
          'Headline6',
        },
        codeblock_highlight = 'CodeBlock',
        dash_highlight = 'Dash',
        quote_highlight = 'Quote',
        fat_headlines = false
      },
      org = {
        fat_headlines = false,
        headline_highlights = { 'Headline1', 'Headline2', 'Headline3', 'Headline4' },
      }
    }
  },

  'folke/tokyonight.nvim',

  {
    'shaunsingh/nord.nvim',
    config = function()
      vim.g.nord_borders = true
      vim.g.nord_italic = false
      vim.g.nord_bold = false

      require('nord').set()
      local colors = require('nord.colors')

      -- Fix highlights
      vim.api.nvim_set_hl(0, "QuickfixLine", { link = "CursorLine" })
      vim.api.nvim_set_hl(0, "qFLineNr", { link = "CursorLine" })
      vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "NONE", bg = "NONE" })
      vim.api.nvim_set_hl(0, "MiniJump", { fg = colors.nord0_gui, bg = colors.nord8_gui })

      vim.cmd("hi Headline1 guibg=NONE")
      vim.cmd("hi Headline2 guibg=NONE")
      vim.cmd("hi Headline3 guibg=NONE")
      vim.cmd("hi Headline4 guibg=NONE")
      vim.cmd("hi Headline5 guibg=NONE")
    end
  },

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
      require('mini.jump').setup()
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

  -- {
  --   "zbirenbaum/copilot-cmp",
  --   config = true,
  --   dependencies = 'copilot.lua'
  -- },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = true
  --   -- opts = {
  --     -- suggestion = { enabled = false },
  --     -- panel = { enabled = false }
  --   -- }
  -- },

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
          accept = "<M-CR>",
          accept_word = false,
          accept_line = false,
          next = "<M-n>",
          prev = "<M-p>",
          dismiss = "<M-BS>",
        },
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

  'andymass/vim-matchup',

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
