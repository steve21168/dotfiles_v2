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
        tmux = {
          enabled = true
        }
      }
    }
  },

  {
    "gaoDean/autolist.nvim",
    ft = {
      "markdown",
      "text",
    },
    config = function()
      local autolist = require("autolist")
      autolist.setup()
      autolist.create_mapping_hook("i", "<CR>", autolist.new)
      autolist.create_mapping_hook("i", "<Tab>", autolist.indent)
      autolist.create_mapping_hook("i", "<S-Tab>", autolist.indent, "<C-D>")
      autolist.create_mapping_hook("n", "o", autolist.new)
      autolist.create_mapping_hook("n", "O", autolist.new_before)
      autolist.create_mapping_hook("n", ">>", autolist.indent)
      autolist.create_mapping_hook("n", "<<", autolist.indent)
      autolist.create_mapping_hook("n", "<C-r>", autolist.force_recalculate)
      autolist.create_mapping_hook("n", ",x", autolist.invert_entry, "")
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

  { "akinsho/toggleterm.nvim", version = '*', config = true, cmd = "ToggleTerm" },

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
    build = function()
      vim.fn["mkdp#util#install"]()
    end
  },
}
