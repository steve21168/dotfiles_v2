return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason.nvim", "mason-lspconfig.nvim"},
    config = function()
      require("user.lsp")
    end
  },
  { 'williamboman/mason.nvim', dependencies = 'nord.nvim' },
  'williamboman/mason-lspconfig.nvim',
}
