-- Pull in the wezterm API
local wezterm = require("wezterm")
local keybinds = require("keybinds")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-----------------------------------------------------------------
--- color scheme
---------------------------------------------------------------
-- For example, changing the color scheme:
config.color_scheme = "tokyonight_night"
---------------------------------------------------------------

-----------------------------------------------------------------
--- config
---------------------------------------------------------------
-- Use GPU accelerated rasterization.
config.front_end = "WebGpu"
-- Scroll bar.
config.enable_scroll_bar = true
-- Hide tab bar.
config.hide_tab_bar_if_only_one_tab = true
-- Tab bar at bottom.
config.tab_bar_at_bottom = true
-- Hide window title.
config.window_decorations = "RESIZE"
-----------------------------------------------------------------

-----------------------------------------------------------------
--- key binds
---------------------------------------------------------------
-- leader key
config.leader = {
  key = "q",
  mods = "CTRL",
  timeout_milliseconds = 2000,
}
-- Set keybinds.
config.keys = keybinds.create_keybinds()
config.key_tables = keybinds.key_tables
---------------------------------------------------------------

-- and finally, return the configuration to wezterm
return config
