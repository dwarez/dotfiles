local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- One Dark (warmer) — navarasu/onedark.nvim palette.
config.colors = {
	foreground = "#a7aab0",
	background = "#232326",
	cursor_bg = "#a7aab0",
	cursor_fg = "#232326",
	cursor_border = "#a7aab0",
	selection_fg = "#a7aab0",
	selection_bg = "#37383d",
	ansi = { "#101012", "#de5d68", "#8fb573", "#dbb671", "#57a5e5", "#bb70d2", "#51a8b3", "#a7aab0" },
	brights = { "#5c6370", "#e86671", "#98c379", "#e5c07b", "#61afef", "#c678dd", "#56b6c2", "#abb2bf" },
	tab_bar = {
		background = "#1b1c1e",
		active_tab = { bg_color = "#a7aab0", fg_color = "#232326" },
		inactive_tab = { bg_color = "#2c2d31", fg_color = "#818387" },
		inactive_tab_hover = { bg_color = "#35363b", fg_color = "#a7aab0" },
		new_tab = { bg_color = "#2c2d31", fg_color = "#818387" },
		new_tab_hover = { bg_color = "#35363b", fg_color = "#a7aab0" },
	},
}

-- Font configuration
config.font = wezterm.font("JetBrains Mono", { weight = "Regular" })
config.font_size = 12.0

-- Window configuration
config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 5,
}

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false

-- Other settings
config.window_background_opacity = 1.0
config.text_background_opacity = 1.0

config.window_close_confirmation = "AlwaysPrompt"
config.keys = {
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
}
-- add this config
config.skip_close_confirmation_for_processes_named = {}

return config
