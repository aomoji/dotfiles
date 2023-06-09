-- Pull in the wezterm API
local wezterm = require("wezterm")
local keybinds = require("keybinds")
local mousebinds = require("mousebinds")
require("on")

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
config.color_scheme = "Rosé Pine (base16)"
---------------------------------------------------------------

-----------------------------------------------------------------
--- font
---------------------------------------------------------------
-- For example, changing the color scheme:
config.font = wezterm.font("Cica")
config.font_size = 14.0
---------------------------------------------------------------

-----------------------------------------------------------------
--- config
---------------------------------------------------------------
-- Use GPU accelerated rasterization.
config.front_end = "WebGpu"
-- Scroll bar.
config.enable_scroll_bar = true
-- Tab bar at bottom.
config.tab_bar_at_bottom = true
-- blinking cursor
config.default_cursor_style = "BlinkingBlock"
-- padding
config.window_padding = {
	left = 20,
	right = 20,
	top = 40,
	bottom = 30,
}
-- decoration
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
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

-----------------------------------------------------------------
--- mouse bindings
---------------------------------------------------------------
config.mouse_bindings = mousebinds.mouse_bindings
---------------------------------------------------------------

-----------------------------------------------------------------
--- unix domain
---------------------------------------------------------------
config.unix_domains = {
	{
		name = "unix",
	},
}

-- This causes `wezterm` to act as though it was started as
-- `wezterm connect unix` by default, connecting to the unix
-- domain on startup.
-- If you prefer to connect manually, leave out this line.
config.default_gui_startup_args = { "connect", "unix" }
---------------------------------------------------------------

-- and finally, return the configuration to wezterm
return config
