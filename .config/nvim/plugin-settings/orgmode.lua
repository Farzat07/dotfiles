local xdg_data = os.getenv("XDG_DATA_HOME") or "~/.local/share"
local orgmode_files = xdg_data .. "/orgmode"

require('orgmode').setup({
  org_agenda_files = {orgmode_files .. '/**/*'},
  org_default_notes_file = orgmode_files .. 'default.org',
})
