return {
  'folke/which-key.nvim',
  config = function()
    local wk = require("which-key")
    wk.setup({
      sort = { "alphanum" },
    })

    wk.add({
      { "<leader>a", group = "AI" },
      { "<leader>c", group = "Config" },
      { "<leader>d", group = "Diagnostics" },
      { "<leader>e", group = "Edit" },
      { "<leader>g", group = "Git" },
      { "<leader>i", group = "Cmdline Interface" },
      { "<leader>l", group = "LSP" },
      { "<leader>s", group = "Search" },
      { "<leader>u", group = "LuaDev" },
      { ",d", group = "Dap" }
    })
  end
}
