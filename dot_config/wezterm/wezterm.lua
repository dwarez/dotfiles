local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Vesper — minimal near-black. Palette: raunofreiberg/vesper.
config.colors = {
	foreground = "#ffffff",
	background = "#101010",
	cursor_bg = "#ffc799",
	cursor_fg = "#101010",
	cursor_border = "#ffc799",
	selection_fg = "#ffffff",
	selection_bg = "#343434",
	ansi = { "#343434", "#ff8080", "#99ffe4", "#ffc799", "#74828d", "#a8774d", "#66cbb2", "#a0a0a0" },
	brights = { "#707070", "#ff9c9c", "#c2ffef", "#ffdabc", "#939ea6", "#bb9574", "#9addcc", "#ffffff" },
	tab_bar = {
		background = "#161616",
		active_tab = { bg_color = "#ffc799", fg_color = "#101010" },
		inactive_tab = { bg_color = "#161616", fg_color = "#a0a0a0" },
		inactive_tab_hover = { bg_color = "#232323", fg_color = "#ffffff" },
		new_tab = { bg_color = "#161616", fg_color = "#a0a0a0" },
		new_tab_hover = { bg_color = "#232323", fg_color = "#ffffff" },
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
