local null_ls = require("null-ls")

local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    sources = {
        -- null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.stylua,
        diagnostics.flake8,
    },
})
