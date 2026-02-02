local wezterm = require "wezterm"
local config = {}

config.front_end = "OpenGL"
config.term = "xterm-256color"
config.prefer_egl = true
config.font = wezterm.font 'Cascadia Code NF'
config.color_scheme = 'Dark Pastel'
config.window_background_opacity = 0.9
config.max_fps = 165
config.font_size = 14.5
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_rate = 500

config.default_prog = { "pwsh.exe" }

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

return config
