return {
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'mason.nvim', 'mason-lspconfig.nvim', 'nvim-dap' },
    config = function()
      require("user.lsp")
      require("user.dap")
    end
  },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'mfussenegger/nvim-dap' },
}
