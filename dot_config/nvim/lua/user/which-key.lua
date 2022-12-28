local wk = require("which-key")

wk.setup {}

wk.register({
  ["<leader>"] = {
    w = { ":w<CR>", "Write" },
    q = { ":q<CR>", "Quit" },
    W = { ":w!<CR>", "Write!" },
    Q = { ":q!<CR>", "Quit!" },
    x = { ":bp <BAR> bd #<CR>", "Buffer delete" },
    X = { ":bp <BAR> bd! #<CR>", "Buffer delete!" },
    b = { ":Buffers<CR>", "Search Buffers" },
    f = { ":Ack!<Space>", "Grep", silent = false},
    t = { ":Files<CR>", "Search files" },
    c = {
      name = "+Config",
      r = { ":source ~/.config/nvim/init.lua <cr>", "Reload config" },
    },
    g = {
      name = "+Git",
      b = { ":Git blame<CR>", "Blame"},
      l = { ":Gitsigns toggle_current_line_blame<CR>", "Blame line" },
      L = { ":lua require 'gitsigns'.blame_line()<CR>", "Blame line (popup)" },
      d = { ":Gitsigns diffthis<CR>", "Diff"},
    },
    l = {
      name = "+LSP",
      i = { ":LspInfo<CR>", "LSP info" },
      I = { ":LspInstallInfo<CR>", "LSP installer info" },
      d = { ":lua vim.lsp.buf.definition()<CR>", "Definition" },
      r = { ":lua vim.lsp.buf.references()<CR>", "References" },
      f = { ":lua vim.lsp.buf.formatting()<CR>", "Formatting" },
      c = { ":lua vim.lsp.buf.code_action()<CR>", "Code actions" },
      h = { ":lua vim.lsp.buf.hover()<CR>", "Hover" },
      m = { ":lua vim.lsp.buf.implementation()<CR>", "Implementation"},
      s = { ":lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
      n = { ":lua vim.lsp.buf.rename()<CR>", "Rename" },
    },
    d = {
      name = "+Diagnostics",
      d = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Diagnostics" },
      c = { "<cmd>lua vim.diagnostic.open_float({ format = function(diagnostic) return diagnostic['code'] end })<cr>", "Diagnostic code" },
      n = { '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', "Next" },
      p = { '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', "Previous" }
    },
    p = {
      name = "Packer",
      i = { ":PackerInstall"},
      c = { ":PackerClean"}
    },
  },
})
