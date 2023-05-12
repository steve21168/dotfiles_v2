-- Fix awful highlights from colorscheme
vim.api.nvim_set_hl(0, "QuickfixLine", { link = "CursorLine" })
vim.api.nvim_set_hl(0, "qFLineNr", { link = "CursorLine" })
vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "NONE", bg = "NONE" })
vim.cmd("hi Headline1 guibg=NONE")
vim.cmd("hi Headline2 guibg=NONE")
vim.cmd("hi Headline3 guibg=NONE")
vim.cmd("hi Headline4 guibg=NONE")
vim.cmd("hi Headline5 guibg=NONE")
