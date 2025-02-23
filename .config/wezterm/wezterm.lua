-- Pull in the wezterm API
local wezterm = require("wezterm")
local keybinds = require("keybinds")
local mousebinds = require("mousebinds")
require("on")

-- local colors = require("lua/rose-pine").colors()
-- local window_frame = require("lua/rose-pine").window_frame()
local colors = require("lua/aardvark_blue").colors()
local window_frame = require("lua/aardvark_blue").window_frame()

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
-- config.color_scheme = "Aardvark Blue"
config.color_scheme = "Everforest Dark (Gogh)"
-- config.colors = colors
-- config.window_frame = window_frame
---------------------------------------------------------------

-----------------------------------------------------------------
--- font
---------------------------------------------------------------
config.font = wezterm.font("HackGen Console NF")
config.font_size = 13.0
---------------------------------------------------------------

-----------------------------------------------------------------
--- config
---------------------------------------------------------------
-- Use GPU accelerated rasterization.
config.front_end = "WebGpu"
-- Scroll bar.
config.enable_scroll_bar = false
-- Tab bar at bottom.
config.tab_bar_at_bottom = false
-- blinking cursor
config.default_cursor_style = "BlinkingBlock"
-- padding
config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}
-- decoration
config.window_decorations = "RESIZE"
-- tab
config.show_new_tab_button_in_tab_bar = false
-- nightly only
-- config.show_close_tab_button_in_tabs = false
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
-- config.unix_domains = {
-- 	{
-- 		name = "unix",
-- 	},
-- }

-- This causes `wezterm` to act as though it was started as
-- `wezterm connect unix` by default, connecting to the unix
-- domain on startup.
-- If you prefer to connect manually, leave out this line.
-- config.default_gui_startup_args = { "connect", "unix" }
---------------------------------------------------------------

-- and finally, return the configuration to wezterm
return config
