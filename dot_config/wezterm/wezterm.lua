local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Modus vivendi (deuteranopia) — accessibility-first, bg lowered to #121212.
config.colors = {
	foreground = "#ffffff",
	background = "#121212",
	cursor_bg = "#efef00",
	cursor_fg = "#121212",
	cursor_border = "#efef00",
	selection_fg = "#ffffff",
	selection_bg = "#3a3a4a",
	ansi = { "#000000", "#ff5f59", "#44bc44", "#cabf00", "#2fafff", "#feacd0", "#00d3d0", "#a6a6a6" },
	brights = { "#595959", "#ff6b55", "#00c06f", "#efef00", "#79a8ff", "#f78fe7", "#6ae4b9", "#ffffff" },
	tab_bar = {
		background = "#1c1c1c",
		active_tab = { bg_color = "#efef00", fg_color = "#121212" },
		inactive_tab = { bg_color = "#1c1c1c", fg_color = "#989898" },
		inactive_tab_hover = { bg_color = "#242424", fg_color = "#ffffff" },
		new_tab = { bg_color = "#1c1c1c", fg_color = "#989898" },
		new_tab_hover = { bg_color = "#242424", fg_color = "#ffffff" },
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
