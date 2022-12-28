local orgmode = require('orgmode')

orgmode.setup_ts_grammar()

orgmode.setup({
  org_agenda_files = {'~/notes/org/*' },
  org_default_notes_file = '~/notes/org/refile.org',
  org_capture_templates = {
    v = {
      description = 'Visual todo (reg v)',
      template = '* TODO %(return vim.fn.getreg "v")\n %u',
    }
  }
})
