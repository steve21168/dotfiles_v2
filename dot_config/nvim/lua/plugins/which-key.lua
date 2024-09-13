return {
  'folke/which-key.nvim',
  config = function()
    local wk = require("which-key")
    wk.setup {}

    wk.add({
      { "<leader>a", group = "AI" },
      { "<leader>c", group = "Config" },
      { "<leader>d", group = "Diagnostics" },
      { "<leader>g", group = "Git" },
      { "<leader>i", group = "Cmdline Interface" },
      { "<leader>l", group = "LSP" },
      { "<leader>s", group = "Search" },
      { "<leader>u", group = "LuaDev" },
      { ",d", group = "Dap" }
    })
  end
}
