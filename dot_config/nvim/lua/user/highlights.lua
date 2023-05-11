-- :hi clear QuickfixLine
-- :hi clear qfLineNr
-- :hi link QuickFixLine CursorLine
-- :hi link qfLineNr CursorLine
-- Fix awful highlights from colorscheme
vim.api.nvim_set_hl(0, "QuickfixLine", { link = "CursorLine" })
vim.api.nvim_set_hl(0, "qFLineNr", { link = "CursorLine" })
vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "NONE", bg = "NONE" })
