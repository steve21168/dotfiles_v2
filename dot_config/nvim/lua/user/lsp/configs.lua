require("mason").setup()
require("mason-lspconfig").setup()

local servers = { "lua_ls", "solargraph" , "eslint", "tsserver", "gopls", "marksman"}

require("mason-lspconfig").setup {
  ensure_installed = servers
}

local lspconfig = require("lspconfig")

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
	 	opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lspconfig[server].setup(opts)
end
