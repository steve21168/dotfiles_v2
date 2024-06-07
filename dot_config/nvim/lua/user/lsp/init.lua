-- Setup LSP
require("mason").setup()
require('java').setup()

local servers = { "lua_ls", "solargraph" , "eslint", "tsserver", "gopls", "marksman" }
local mason_servers = { "lua_ls", "eslint", "tsserver", "gopls", "marksman" }

require("mason-lspconfig").setup {
  ensure_installed = mason_servers
}

local lspconfig = require("lspconfig")

lspconfig.jdtls.setup({})

for _, server in pairs(servers) do
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

	local opts = {
		-- on_attach = nil,
		capabilities = capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
    opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lspconfig[server].setup(opts)
end

-- Customize LSP
local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  -- disable virtual text
  virtual_text = false,
  -- show signs
  signs = {
    active = signs,
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})
