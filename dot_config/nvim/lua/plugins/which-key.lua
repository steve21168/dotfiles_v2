return {
  'folke/which-key.nvim',
  config = function()
    local wk = require("which-key")
    wk.setup {}

    wk.register({
      ["<leader>"] = {
        c = { name = "+Config" },
        g = { name = "+Git" },
        l = { name = "+LSP" },
        d = { name = "+Diagnostics" },
        i = { name ="+Cmdline Interace" },
        s = { name = "+Search" },
        u = { name = "+LuaDev" }
      },
      [','] = {
        d = { name = "+Dap" },
      }
    })
  end
}
