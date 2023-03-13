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
    b = { ":Telescope buffers<CR>", "Search Buffers" },
    f = { ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", "Grep", silent = true},
    -- f = { ":Telescope live_grep<CR>", "Grep", silent = false},
    t = { ":Telescope find_files<CR>", "Search files" },
    r = { ":Telescope resume<CR>", "Resume telescope search" },
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
      g = { ":TermExec cmd=lazygit direction=float<CR>", "Lazygit", silent = true },
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
      l = { ":LspLog<CR>", "LspLog"}
    },
    d = {
      name = "+Diagnostics",
      d = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Diagnostics" },
      c = { "<cmd>lua vim.diagnostic.open_float({ format = function(diagnostic) return diagnostic['code'] end })<cr>", "Diagnostic code" },
      n = { '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', "Next" },
      p = { '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', "Previous" }
    },
    i = {
      name ="+Cmdline Interace",
      t = { ":ToggleTerm direction=float<CR>", "Toggleterm" },
    },
    p = {
      name = "+Packer",
      i = { ":PackerInstall<CR>", "Packer install"},
      c = { ":PackerClean<CR>", "Packer Clean"}
    },
    s = {
      name = "+Search",
      w = { ':Telescope grep_string<CR>', "Grep word under cursor" }
    }
  },
})
