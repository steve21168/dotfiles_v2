local orgmode = require('orgmode')

orgmode.setup_ts_grammar()

orgmode.setup({
  org_agenda_files = {'~/Dropbox/notes/org/*' },
  org_default_notes_file = '~/Dropbox/notes/org/misc.org',
  org_blank_before_new_entry = { heading = false, plain_list_item = false },
  org_todo_keywords = {'TODO', 'WIP', '|', 'DONE'},
  -- org_todo_keyword_faces = {
  --   WIP = ':foreground #d9a300 :weight bold',
  -- },
  org_capture_templates = {
    v = {
      description = 'Visual todo (reg v)',
      template = '* TODO %(return vim.fn.getreg "v")\n %u',
    }
  }
})

require('org-bullets').setup({
  symbols = {
    headlines = { "◉", "○", "✸", "✿" },
  }
})

-- Maintains colors on fold
require('ufo').setup({
  provider_selector = function(_, _)
    return ''
  end,
})
-- Removes fold highlighting
vim.cmd([[
  augroup orgmode_disable_highlight
    autocmd!
    autocmd BufNewFile,BufRead *.org highlight folded none
  augroup end
]])
