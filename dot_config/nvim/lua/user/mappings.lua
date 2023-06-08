local api = vim.api

local normal_mappings = {
  { lhs = '<leader>b', rhs = ":Telescope buffers<CR>", desc = "Search Buffers" },

  --  +Config
  { lhs = '<leader>cr', rhs = ":source ~/.config/nvim/init.lua <CR>", desc = "Reload config" },

  -- +Diagnostics
  { lhs = '<leader>dd', rhs = "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Diagnostics" },
  {
    lhs = '<leader>dc',
    rhs ="<cmd>lua vim.diagnostic.open_float({ format = function(diagnostic) return diagnostic['code'] end })<cr>",
    desc = "Diagnostic code"
  },
  { lhs = '<leader>dn', rhs = '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', desc = "Next" },
  { lhs = '<leader>dp', rhs = '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', desc = "Previous" },

  {
    lhs = '<leader>f',
    rhs = ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
    desc = "Grep",
    opts = { silent = true }
  },

  -- +Git
  { lhs = '<leader>gb', rhs = ":Git blame<CR>", desc = "Blame"},
  { lhs = '<leader>gl', rhs = ":Gitsigns toggle_current_line_blame<CR>", desc = "Blame line"},
  { lhs = '<leader>gL', rhs = ":lua require 'gitsigns'.blame_line()<CR>", desc = "Blame line (popup)" },
  { lhs = '<leader>d', rhs = ":Gitsigns diffthis<CR>", desc = "Diff" },

  -- +Cmdline Interace
  { lhs = '<leader>it', rhs = ":ToggleTerm direction=float<CR>", desc = "Toggleterm" },
  { lhs = '<leader>ig',  rhs = ":TermExec cmd=lazygit direction=float<CR>", desc = "Lazygit" },
  { lhs = '<leader>id',  rhs = ":TermExec cmd=lazydocker direction=float<CR>", desc = "Lazydocker" },

  -- +LSP
  { lhs = '<leader>li', rhs = ":LspInfo<CR>", desc = "LSP info" },
  { lhs = '<leader>lI', rhs = ":LspInstallInfo<CR>", desc = "LSP installer info" },
  { lhs = '<leader>ld', rhs = ":lua vim.lsp.buf.definition()<CR>", desc = "Definition" },
  { lhs = '<leader>lr', rhs = ":lua vim.lsp.buf.references()<CR>", desc = "References" },
  { lhs = '<leader>lf', rhs = ":lua vim.lsp.buf.formatting()<CR>", desc = "Formatting" },
  { lhs = '<leader>lc', rhs = ":lua vim.lsp.buf.code_action()<CR>", desc = "Code actions" },
  { lhs = '<leader>lh', rhs = ":lua vim.lsp.buf.hover()<CR>", desc = "Hover" },
  { lhs = '<leader>lm', rhs = ":lua vim.lsp.buf.implementation()<CR>", desc = "Implementation"},
  { lhs = '<leader>ls', rhs = ":lua vim.lsp.buf.signature_help()<CR>", desc = "Signature help" },
  { lhs = '<leader>ln', rhs = ":lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
  { lhs = '<leader>ll', rhs = ":LspLog<CR>", desc = "LspLog" },

  { lhs = '<leader>r', rhs = ":Telescope resume<CR>", desc = "Resume telescope search" },

  -- "+Search",
  { lhs = '<leader>sw', rhs = ':Telescope grep_string<CR>', desc = "Grep word under cursor" },

  { lhs = '<leader>t', rhs = ":Telescope find_files<CR>", desc = "Search files" },

  -- +LuaDv
  {
    lhs = '<leader>ur',
    rhs = ":lua package.loaded[''] = nil <left><left><left><left><left><left><left><left><left>",
    desc = "Reload package",
  },
  { lhs = '<leader>ui', rhs = ":lua print(vim.inspect())<left><left>", desc = "Inspect" },

  { lhs = '<leader>q', rhs = ':q<CR>', desc = "Quit" },
  { lhs = '<leader>Q', rhs = ':q!<CR>', desc = "Quit!" },
  { lhs = '<leader>w', rhs = ':w<CR>', desc = "Write" },
  { lhs = '<leader>W', rhs = ':w!<CR>', desc = "Write!" },
  { lhs = '<leader>x', rhs = ":bp <BAR> bd #<CR>", desc = "Buffer delete" },
  { lhs = '<leader>X', rhs = ":bp <BAR> bd! #<CR>", desc = "Buffer delete!" },
  { lhs = '<leader>z', rhs = ":Lazy<CR>", desc = "Lazy"},

  { lhs = ',d', rhs = ":lua require('command-pat').OperateOnNSelection()<CR>", desc = "Run command on pattern"},
  { lhs = ',n', rhs = ":lua require('command-pat').OperateOnPattern()<CR>", desc = "Run command on pattern"},
}

local visual_mappings = {
  { lhs = ',d', rhs = ":lua require('command-pat').OperateOnVSelection()<CR>", desc = "Run command on pattern"},
}

local mappings = { ['n'] = normal_mappings, ['v'] = visual_mappings }

for mode, mapping in pairs(mappings) do
  for _, map in ipairs(mapping) do
    local options = { desc = map['desc'] }
    local user_opts = map['opts']

    if user_opts then
      options = vim.tbl_extend('force', options, user_opts)
    end

    api.nvim_set_keymap(mode, map['lhs'], map['rhs'], options)
  end
end
