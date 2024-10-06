-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = wezterm.config_builder()

config.audible_bell = "Disabled"

config.font =
    wezterm.font('JetbrainsMono Nerd Font')
config.color_scheme = "GruvboxDarkHard"
-- config.color_schemes = {
-- 	["GruvboxDarkHard"] = {
-- 		background = "#1b1b1c",
-- 	},
-- }


config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

config.keys = {}
local act = wezterm.action
for i = 1, 8 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = 'CTRL',
        action = act.ActivateTab(i - 1),
    })
end

config.window_frame = {
    border_left_width = '0.1cell',
    border_right_width = '0.1cell',
    border_bottom_height = '0.05cell',
    border_top_height = '0.05cell',
    border_left_color = '#5aa6c1',
    border_right_color = '#5aa6c1',
    border_bottom_color = '#5aa6c1',
    border_top_color = '#5aa6c1',
}

-- config.window_decorations = "NONE"
config.font_size = 35

config.automatically_reload_config = true
config.check_for_updates = true

config.pane_focus_follows_mouse = true
-- config.window_background_opacity = 0.95
config.default_prog = { '/usr/bin/zsh', '-l' }
config.hide_mouse_cursor_when_typing = true
-- config.xcursor_theme = "Breeze-Light"
-- config.xcursor_size = 18

return config
