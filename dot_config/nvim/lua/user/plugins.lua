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

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    }
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
  use 'williamboman/nvim-lsp-installer'

  -- Lua plugins
  use 'folke/which-key.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'lewis6991/gitsigns.nvim'
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires  = { 'nvim-lua/plenary.nvim' }
  }
  use 'windwp/nvim-autopairs'

  use 'nvim-orgmode/orgmode'
  use 'akinsho/org-bullets.nvim'
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'} -- Fix fold issues


  use 'nvim-treesitter/playground'
  use { 'rafcamlet/nvim-luapad', requires = "antoinemadec/FixCursorHold.nvim" }

  -- Standard Vim Plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'mileszs/ack.vim'
  use {
    'junegunn/fzf',
    run = ":call fzf#install()",
    requires = {  'junegunn/fzf.vim' }
  }
  use 'junegunn/fzf.vim'
  use 'tpope/vim-commentary'
  use 'christoomey/vim-tmux-navigator'
  use 'rafi/awesome-vim-colorschemes'
  use 'ntpeters/vim-better-whitespace'
  use 'tmux-plugins/vim-tmux-focus-events'
  use 'jeetsukumaran/vim-buffergator'
  use 'milkypostman/vim-togglelist'
  use 'arcticicestudio/nord-vim'

  use {
    'kana/vim-textobj-line',
    requires = {
      'kana/vim-textobj-user'
    }
  }
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  if packer_bootstrap then
    require('packer').sync()
  end
end)
