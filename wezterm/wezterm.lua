local wezterm = require 'wezterm'
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.term = "xterm-256color"
config.font_size = 17.0
config.font = wezterm.font("0xProto Nerd Font")
config.color_scheme = "Tokyo Night"

config.initial_cols = 141
config.initial_rows = 40

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.enable_scroll_bar = true
config.colors = {
	scrollbar_thumb = "#666666",
}

return config
