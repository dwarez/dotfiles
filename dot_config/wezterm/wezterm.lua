local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Dracula — official palette (dracula/kitty), verbatim.
config.colors = {
	foreground = "#f8f8f2",
	background = "#282a36",
	cursor_bg = "#f8f8f2",
	cursor_fg = "#282a36",
	cursor_border = "#f8f8f2",
	selection_fg = "#ffffff",
	selection_bg = "#44475a",
	ansi = { "#21222c", "#ff5555", "#50fa7b", "#f1fa8c", "#bd93f9", "#ff79c6", "#8be9fd", "#f8f8f2" },
	brights = { "#6272a4", "#ff6e6e", "#69ff94", "#ffffa5", "#d6acff", "#ff92df", "#a4ffff", "#ffffff" },
	tab_bar = {
		background = "#21222c",
		active_tab = { bg_color = "#f8f8f2", fg_color = "#282a36" },
		inactive_tab = { bg_color = "#6272a4", fg_color = "#282a36" },
		inactive_tab_hover = { bg_color = "#44475a", fg_color = "#f8f8f2" },
		new_tab = { bg_color = "#6272a4", fg_color = "#282a36" },
		new_tab_hover = { bg_color = "#44475a", fg_color = "#f8f8f2" },
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
