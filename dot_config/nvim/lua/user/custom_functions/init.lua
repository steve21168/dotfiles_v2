local M = {}

M.grep_quickfix_files = function()
  local file_list = {}
  local qf_list = vim.fn.getqflist()

  for i, v in ipairs(qf_list) do
    file_list[i] = vim.api.nvim_buf_get_name(v.bufnr)
  end

  local telescope = require('telescope.builtin')
  telescope.live_grep({search_dirs = file_list})
end

-- For telescope usage
M.downward_grep = function()
  local telescope = require('telescope.builtin')
  local action_utils = require("telescope.actions.utils")
  local prompt_bufnr = vim.api.nvim_get_current_buf()
  local unique_files = {}
  local file_list = {}

  action_utils.map_entries(prompt_bufnr, function(entry) --, _index, _row)
    if  not unique_files[entry.path] then
      unique_files[entry.path] = true
      table.insert(file_list, entry.path)
    end
  end)

  telescope.live_grep({search_dirs = file_list})
end

return M
