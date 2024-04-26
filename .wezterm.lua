-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = wezterm.config_builder()

config.audible_bell = "Disabled"

config.font =
	wezterm.font('JetbrainsMonoNL Nerd Font')

config.color_scheme = "GruvboxDarkHard"
config.hide_tab_bar_if_only_one_tab = true
config.font_size = 19

config.automatically_reload_config = true
config.check_for_updates = true

config.pane_focus_follows_mouse = true
-- config.window_background_opacity = 0.95

return config
