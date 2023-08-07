return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      require("user.dap")
    end
  },
  {
    'rcarriga/nvim-dap-ui',
    config = true,
    dependencies = { 'nvim-dap' }
  }
}
