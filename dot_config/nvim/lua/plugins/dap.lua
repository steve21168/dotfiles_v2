return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      require("user.dap")
    end,
    dependencies = { "nvim-neotest/nvim-nio" }
  },
  {
    'rcarriga/nvim-dap-ui',
    config = true,
    dependencies = { 'nvim-dap' }
  }
}
