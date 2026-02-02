local wezterm = require("wezterm")
local config = {}

config.front_end = "OpenGL"
config.term = "xterm-256color"
config.prefer_egl = true
config.font = wezterm.font("FiraCode Nerd Font Propo SemBd")
config.window_background_opacity = 0.80
config.window_decorations = "NONE"
config.font_size = 13
config.default_cursor_style = "SteadyBlock"

config.default_prog = { "pwsh" }

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

config.colors = {
  foreground = '#FFCC70',
  background = '#000000',

  -- Overrides the cell background color when the current cell is occupied by the
  -- cursor and the cursor style is set to Block
  cursor_bg = '#FFCC70',
  -- Overrides the text color when the current cell is occupied by the cursor
  cursor_fg = '#101010',
  -- Specifies the border color of the cursor when the cursor style is set to Block,
  -- or the color of the vertical or horizontal bar when the cursor style is set to
  -- Bar or Underline.
  cursor_border = '#FFCC70',

  -- the foreground color of selected text
  selection_fg = '#FFCC70',
  -- the background color of selected text
  selection_bg = '#0000FF',

  -- The color of the scrollbar "thumb"; the portion that represents the current viewport
  scrollbar_thumb = '#222222',

  -- The color of the split lines between panes
  split = '#444444',

  ansi = {
    '#000000',
    '#EE2020',
    '#00FF00',
    '#FFCC70',
    '#0000FF',
    '#FF00FF',
    '#00FFFF',
    '#AAAAAA',
  },
  brights = {
    '#757575',
    '#EE2020',
    '#00FF00',
    '#FFCC70',
    '#0000FF',
    '#FF00FF',
    '#00FFFF',
    '#FFFFFF',
  },

  -- Arbitrary colors of the palette in the range from 16 to 255
  -- indexed = { [136] = '#af8700' },

  -- Since: 20220319-142410-0fcdea07
  -- When the IME, a dead key or a leader key are being processed and are effectively
  -- holding input pending the result of input composition, change the cursor
  -- to this color to give a visual cue about the compose state.
  compose_cursor = 'orange',

  -- Colors for copy_mode and quick_select
  -- available since: 20220807-113146-c2fee766
  -- In copy_mode, the color of the active text is:
  -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
  -- 2. selection_* otherwise
  copy_mode_active_highlight_bg = { Color = '#000000' },
  -- use `AnsiColor` to specify one of the ansi color palette values
  -- (index 0-15) using one of the names "Black", "Maroon", "Green",
  --  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
  -- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
  copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
  copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
  copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },

  quick_select_label_bg = { Color = 'peru' },
  quick_select_label_fg = { Color = '#ffffff' },
  quick_select_match_bg = { AnsiColor = 'Navy' },
  quick_select_match_fg = { Color = '#ffffff' },

  input_selector_label_bg = { AnsiColor = 'Black' }, -- (*Since: Nightly Builds Only*)
  input_selector_label_fg = { Color = '#ffffff' }, -- (*Since: Nightly Builds Only*)

  launcher_label_bg = { AnsiColor = 'Black' }, -- (*Since: Nightly Builds Only*)
  launcher_label_fg = { Color = '#ffffff' }, -- (*Since: Nightly Builds Only*)
}

return config
