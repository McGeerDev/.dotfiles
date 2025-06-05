-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

config.automatically_reload_config = true

-- For example, changing the color scheme:
config.color_scheme = "Google (light) (terminal.sexy)"
-- config.color_scheme = 'Google Light (Gogh)'
-- config.color_scheme = 'nord-light'

-- Tab settings
config.hide_tab_bar_if_only_one_tab = true

-- Window settings
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

-- config.window_decorations = "RESIZE"

config.window_padding = {
	left = "2cell",
	right = "2cell",
	top = "0cell",
	bottom = "0cell",
}

-- Font
config.font = wezterm.font("Fira Code")
config.font_size = 14.0

-- Keys
config.keys = {
	-- Turn off the default CMD-m Hide action, allowing CMD-m to
	-- be potentially recognized and handled by the tab
	{
		key = "m",
		mods = "CMD",
		action = act.DisableDefaultAssignment,
	},
	-- Clears the scrollback and viewport leaving the prompt line the new first line.
	{
		key = "k",
		mods = "CMD",
		action = act.ClearScrollback("ScrollbackAndViewport"),
	},
	-- Move between panes
	{
		key = "l",
		mods = "SHIFT|CMD",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "h",
		mods = "SHIFT|CMD",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "k",
		mods = "SHIFT|CMD",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "SHIFT|CMD",
		action = act.ActivatePaneDirection("Down"),
	},
}

-- and finally, return the configuration to wezterm
return config
