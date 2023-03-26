-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

local act = wezterm.action
config.window_decorations = "RESIZE"

---------------------------------------------------------------
--- functions
---------------------------------------------------------------
local function merge_lists(t1, t2)
  local result = {}
  for _, v in pairs(t1) do
    table.insert(result, v)
  end
  for _, v in pairs(t2) do
    table.insert(result, v)
  end
  return result
end
---------------------------------------------------------------

-----------------------------------------------------------------
--- wezterm on
---------------------------------------------------------------
-- Show workspace name.
wezterm.on("update-right-status", function(window)
  window:set_right_status(window:active_workspace())
end)
---------------------------------------------------------------

-----------------------------------------------------------------
--- color scheme
---------------------------------------------------------------
-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
config.color_scheme = "Kanagawa (Gogh)"
---------------------------------------------------------------

-----------------------------------------------------------------
--- key binds
---------------------------------------------------------------
-- leader key
config.leader = {
  key = "q",
  mods = "CTRL",
  timeout_milliseconds = 2000,
}

-- key tables
config.key_tables = {
  resize_pane = {
    { key = "h", action = act({ AdjustPaneSize = { "Left", 1 } }) },
    { key = "l", action = act({ AdjustPaneSize = { "Right", 1 } }) },
    { key = "k", action = act({ AdjustPaneSize = { "Up", 1 } }) },
    { key = "j", action = act({ AdjustPaneSize = { "Down", 1 } }) },
    -- Cancel the mode by pressing q.
    { key = "q", action = "PopKeyTable" },
  },
  search_mode = {
    { key = "Enter",  mods = "NONE", action = act.CopyMode("PriorMatch") },
    { key = "Escape", mods = "NONE", action = act.CopyMode("Close") },
    { key = "n",      mods = "CTRL", action = act.CopyMode("NextMatch") },
    { key = "p",      mods = "CTRL", action = act.CopyMode("PriorMatch") },
    { key = "r",      mods = "CTRL", action = act.CopyMode("CycleMatchType") },
    { key = "u",      mods = "CTRL", action = act.CopyMode("ClearPattern") },
    {
      key = "PageUp",
      mods = "NONE",
      action = act.CopyMode("PriorMatchPage"),
    },
    {
      key = "PageDown",
      mods = "NONE",
      action = act.CopyMode("NextMatchPage"),
    },
  },
}

-- This table will hold the keybinds.
local K = {}

K.tmux_keybinds = {
  -- for enabling control + q.
  { mods = "CTRL", key = "q",       action = act({ SendString = "\x11" }) },
  { key = "[",     mods = "LEADER", action = "ActivateCopyMode" },
  { key = "v",     mods = "LEADER", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
  { key = "s",     mods = "LEADER", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
  { key = "c",     mods = "LEADER", action = act({ SpawnTab = "CurrentPaneDomain" }) },
  { key = "h",     mods = "LEADER", action = act({ ActivatePaneDirection = "Left" }) },
  { key = "l",     mods = "LEADER", action = act({ ActivatePaneDirection = "Right" }) },
  { key = "j",     mods = "LEADER", action = act({ ActivatePaneDirection = "Down" }) },
  { key = "k",     mods = "LEADER", action = act({ ActivatePaneDirection = "Up" }) },
  { key = "/",     mods = "LEADER", action = act.Search("CurrentSelectionOrEmptyString") },
  -- workspace selection
  { key = "w",     mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
  -- tab selection
  { key = ",",     mods = "LEADER", action = act.ShowTabNavigator },
  { key = "n",     mods = "LEADER", action = act({ ActivateTabRelative = 1 }) },
  { key = "p",     mods = "LEADER", action = act({ ActivateTabRelative = -1 }) },
  { key = "1",     mods = "LEADER", action = act({ ActivateTab = 0 }) },
  { key = "2",     mods = "LEADER", action = act({ ActivateTab = 1 }) },
  { key = "3",     mods = "LEADER", action = act({ ActivateTab = 2 }) },
  { key = "4",     mods = "LEADER", action = act({ ActivateTab = 3 }) },
  { key = "5",     mods = "LEADER", action = act({ ActivateTab = 4 }) },
  { key = "6",     mods = "LEADER", action = act({ ActivateTab = 5 }) },
  { key = "7",     mods = "LEADER", action = act({ ActivateTab = 6 }) },
  { key = "8",     mods = "LEADER", action = act({ ActivateTab = 7 }) },
  { key = "9",     mods = "LEADER", action = act({ ActivateTab = 8 }) },
}

K.default_keybinds = {
  {
    key = "r",
    mods = "LEADER",
    action = act.ActivateKeyTable({
      name = "resize_pane",
      one_shot = false,
    }),
  },
  { key = "a", mods = "LEADER", action = act.ActivateCommandPalette },
}

config.keys = merge_lists(K.default_keybinds, K.tmux_keybinds)
---------------------------------------------------------------

-----------------------------------------------------------------
--- others
---------------------------------------------------------------
-- Use GPU accelerated rasterization.
config.front_end = "WebGpu"
-- Scroll bar.
config.enable_scroll_bar = true
---------------------------------------------------------------

-- and finally, return the configuration to wezterm
return config
