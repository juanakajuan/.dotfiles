-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = wezterm.config_builder()

config.audible_bell = "Disabled"

-- config.font =
-- 	wezterm.font('JetbrainsMonoNL Nerd Font')
config.color_scheme = "GruvboxDarkHard"
-- config.color_schemes = {
-- 	["GruvboxDarkHard"] = {
-- 		background = "#1b1b1c",
-- 	},
-- }


config.hide_tab_bar_if_only_one_tab = true
-- config.window_decorations = "NONE"
config.font_size = 37

config.automatically_reload_config = true
config.check_for_updates = true

config.pane_focus_follows_mouse = true
-- config.window_background_opacity = 0.95
config.default_prog = { '/usr/bin/zsh', '-l' }
config.hide_mouse_cursor_when_typing = true
-- config.xcursor_theme = "Bibata-Modern-Ice"
-- config.xcursor_size = 20

return config
