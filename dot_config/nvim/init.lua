vim.cmd('source ~/.vimrc')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  change_detection = {
    enabled = true,
    notify = false, -- get a notification when changes are found
  },
})

require('user.options')
require('user.mappings')

-- Hack for search to redraw with noice
vim.api.nvim_create_autocmd("CmdlineChanged", {
  group = vim.api.nvim_create_augroup("update_search_redraw", {}),
  desc = "Update search redraw",
  callback = function()
    vim.schedule(function()
      vim.cmd("redraw")
    end)
  end,
})
