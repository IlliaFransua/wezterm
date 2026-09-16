local wezterm = require("wezterm")
-- local constants = require("constants")
-- local commands = require("commands")
local config = wezterm.config_builder()

-- Font settings
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14.0
config.line_height = 1.2

-- Cursor
config.colors = {
	cursor_bg = "#50A14F",
	cursor_border = "#50A14F",
}

-- Appearance
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
-- config.window_background_image = constants.bg_image
-- config.macos_window_background_blur = 40

config.window_background_opacity = 0.6
config.macos_window_background_blur = 20

-- tmp
config.default_cursor_style = "SteadyBlock"
config.cursor_blink_rate = 0
config.force_reverse_video_cursor = false
config.hide_mouse_cursor_when_typing = true
-- tmp

-- Miscelaneous settings
config.max_fps = 120
config.prefer_egl = true

-- Theme
config.color_schemes = {
	["GitHub Dark"] = {
		foreground = "#e6edf3",
		background = "#0d1117",
		cursor_bg = "#e6edf3",
		cursor_fg = "#0d1117",
		selection_bg = "#1f6feb",
		selection_fg = "#ffffff",
		ansi = { "#484f58", "#ff7b72", "#3fb950", "#d29922", "#58a6ff", "#bc8cff", "#39c5cf", "#b1bac4" },
		brights = { "#6e7681", "#ffa198", "#56d364", "#e3b341", "#79c0ff", "#d2a8ff", "#56d4dd", "#f0f6fc" },
	},
	["GitHub Light"] = {
		foreground = "#24292f",
		background = "#ffffff",
		cursor_bg = "#24292f",
		cursor_fg = "#ffffff",
		selection_bg = "#0969da",
		selection_fg = "#ffffff",
		ansi = { "#24292f", "#cf222e", "#116329", "#4d2d00", "#0969da", "#8250df", "#1b7c83", "#6e7781" },
		brights = { "#57606a", "#a40e26", "#1a7f37", "#633c01", "#218bff", "#a475f9", "#3192aa", "#8c959f" },
	},
}

config.color_scheme_dirs = { "~/.config/wezterm/colors" }

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Everforest Dark (Hard)" -- "GitHub Dark"
	else
		return "Everforest Light (Hard)" -- "GitHub Light"
	end
end

config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

local appearance = wezterm.gui.get_appearance()
if appearance:find("Dark") then
	config.window_background_opacity = 0.8
	config.macos_window_background_blur = 20
else
	config.window_background_opacity = 1.0
end

-- Lazyvim Underline
config.underline_thickness = 2
config.underline_position = -2

return config
