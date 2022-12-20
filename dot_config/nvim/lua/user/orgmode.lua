local orgmode = require('orgmode')

orgmode.setup_ts_grammar()

orgmode.setup({
  org_agenda_files = {'~/notes/org/*' },
  org_default_notes_file = '~/notes/org/refile.org',
})
