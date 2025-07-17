-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = {}
-- Use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.automatically_reload_config = true

-- For example, changing the color scheme:
config.color_scheme = "Google (light) (terminal.sexy)"
--config.color_scheme = 'Google Light (Gogh)'
--config.color_scheme = "nord-light"
--config.color_scheme = "Homebrew Light (Gogh)"
--config.color_scheme = "Papercolor Light (Gogh)"

-- Tab settings
config.hide_tab_bar_if_only_one_tab = true

-- Window settings
config.window_background_opacity = 0.85
config.macos_window_background_blur = 10

config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "home"

-- Dim inactive panes
config.inactive_pane_hsb = {
	saturation = 0.30,
	brightness = 0.7,
}

config.window_decorations = "RESIZE"
config.window_padding = {
	left = "2cell",
	right = "2cell",
	top = "0cell",
	bottom = "0cell",
}
config.window_frame = {
	border_left_width = "0.75px",
	border_right_width = "0.75px",
	border_bottom_height = "0.5px",
	border_top_height = "0.5px",
}

-- Font
config.font = wezterm.font("Fira Code")
config.font_size = 16.0

config.keys = {
	-- Turn off the default CMD-m Hide action, allowing CMD-m to
	-- be potentially recognized and handled by the tab
	{ key = "m", mods = "CMD", action = act.DisableDefaultAssignment },
	-- Clears the scrollback and viewport leaving the prompt line the new first line.
	{ key = "k", mods = "CMD", action = act.ClearScrollback("ScrollbackAndViewport") },
	-- Move between panes
	{ key = "l", mods = "SHIFT|CMD", action = act.ActivatePaneDirection("Right") },
	{ key = "h", mods = "SHIFT|CMD", action = act.ActivatePaneDirection("Left") },
	{ key = "k", mods = "SHIFT|CMD", action = act.ActivatePaneDirection("Up") },
	{ key = "j", mods = "SHIFT|CMD", action = act.ActivatePaneDirection("Down") },
	-- Resolve this spliting pane issue
	{ key = "-", mods = "SHIFT|CMD", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- SHIFT is for when caps lock is on
	{ key = "|", mods = "SHIFT|CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "x", mods = "SHIFT|CMD", action = act.CloseCurrentPane({ confirm = true }) },
	-- Reset the font size to 16px
	{ key = "0", mods = "CMD", action = act.ResetFontSize },
}

-- and finally, return the configuration to wezterm
return config
