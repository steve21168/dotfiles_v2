local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use { "wbthomason/packer.nvim" }

  -- Telescope
  use {
  'nvim-telescope/telescope.nvim',
   tag = '0.1.0',
   requires = {
      {'nvim-lua/plenary.nvim'},
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
}
  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    after = "nord.nvim",
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require'nvim-tree'.setup {
        respect_buf_cwd = true,
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
        renderer = {
          highlight_opened_files = 'all',
          highlight_git = true,
          add_trailing = true,
          group_empty = true,
          icons = {
            symlink_arrow = ' >> ',
            show = {
              git = true,
              folder = true,
              file = true,
              folder_arrow = true,
            },
            glyphs = {
              default = "",
              symlink = "",
              folder = {
                arrow_open = "",
                arrow_closed = "",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "",
              },
              git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "★",
                deleted = "",
                ignored = "◌"
              },
            },
          },
          special_files = { "README.md", "Makefile", "MAKEFILE" } -- List of filenames that gets highlighted with NvimTreeSpecialFile
        }
      }
    end
  }

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  -- CMP
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- Lua plugins
  use 'folke/which-key.nvim'
  use 'lewis6991/gitsigns.nvim'
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires  = { 'nvim-lua/plenary.nvim' }
  }
  use 'nvim-orgmode/orgmode'
  use 'akinsho/org-bullets.nvim'
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'} -- Fix fold issues


  use 'nvim-treesitter/playground'
  use { 'rafcamlet/nvim-luapad', requires = "antoinemadec/FixCursorHold.nvim" }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }


  use {
    'lukas-reineke/headlines.nvim',
    after = 'nvim-treesitter',
    config = function()
      require("headlines").setup({
        markdown = {
          headline_highlights = {
            "Headline1",
            "Headline2",
            "Headline3",
            "Headline4",
            "Headline5",
            "Headline6",
          },
          codeblock_highlight = "CodeBlock",
          dash_highlight = "Dash",
          quote_highlight = "Quote",
          fat_headlines = false
        },
        org = {
          fat_headlines = false
        }
      })
    end,
  }

  use 'folke/tokyonight.nvim'

  use {
    'shaunsingh/nord.nvim',
    config = function()
      vim.g.nord_borders = true
      vim.g.nord_italic = false
      vim.g.nord_bold = false

      require('nord').set()
    end
  }

  use {
    "nvim-lualine/lualine.nvim",
    after = "nord.nvim",
    config = function()
      require('lualine').setup {
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        options = {
          theme = "nord"
        }
      }
    end,
  }

  -- use {
  --   'nordtheme/vim',
  --   config = function()
  --     vim.cmd [[colorscheme nord]]
  --   end
  -- }

  -- Mini
  use {
    'echasnovski/mini.nvim',
    branch = 'stable',
    config = function()
      require('mini.comment').setup()
      require('mini.indentscope').setup({
        symbol = "│",
        options = { indent_at_cursor = false, try_as_border = true },
      })
      require('mini.jump').setup()
      require('mini.pairs').setup()
      require('mini.surround').setup()
    end
  }
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}

  -- Standard Vim Plugins
  use 'tpope/vim-fugitive'
  use 'christoomey/vim-tmux-navigator'
  use {
    'ntpeters/vim-better-whitespace',
    config = function()
      vim.g.better_whitespace_filetypes_blacklist= { 'toggleterm' }
    end
  }
  use 'milkypostman/vim-togglelist'
  use 'andymass/vim-matchup'

  use {
    'kana/vim-textobj-line',
    requires = {
      'kana/vim-textobj-user'
    }
  }
  use({
    "iamcco/markdown-preview.nvim",
    config = function()
      vim.fn["mkdp#util#install"]()
    end
  })

  if packer_bootstrap then
    require('packer').sync()
  end
end)
