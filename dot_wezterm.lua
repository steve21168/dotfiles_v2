local config = {}
local wezterm = require 'wezterm'
local action = wezterm.action

config.color_scheme = 'Catppuccin Frappe'
config.font = wezterm.font('RobotoMono Nerd Font')
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.keys  = {
  {
    key = "f",
    mods = "CMD",
    action = action.Search { CaseInSensitiveString = "" }
  },
}

return config
