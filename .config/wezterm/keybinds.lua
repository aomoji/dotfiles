-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
local utils = require("utils")
require("on")

local K = {}

K.key_tables = {
	resize_pane = {
		{ key = "h", action = act({ AdjustPaneSize = { "Left", 1 } }) },
		{ key = "l", action = act({ AdjustPaneSize = { "Right", 1 } }) },
		{ key = "k", action = act({ AdjustPaneSize = { "Up", 1 } }) },
		{ key = "j", action = act({ AdjustPaneSize = { "Down", 1 } }) },
		-- Cancel the mode by pressing q.
		{ key = "q", action = "PopKeyTable" },
	},
	search_mode = {
		{ key = "Enter", mods = "NONE", action = act.CopyMode("PriorMatch") },
		{ key = "Escape", mods = "NONE", action = act.CopyMode("Close") },
		{ key = "n", mods = "CTRL", action = act.CopyMode("NextMatch") },
		{ key = "p", mods = "CTRL", action = act.CopyMode("PriorMatch") },
		{ key = "r", mods = "CTRL", action = act.CopyMode("CycleMatchType") },
		{ key = "u", mods = "CTRL", action = act.CopyMode("ClearPattern") },
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

K.tmux_keybinds = {
	-- for enabling control + q.
	{ mods = "CTRL", key = "q", action = act({ SendString = "\x11" }) },
	{ key = "[", mods = "LEADER", action = "ActivateCopyMode" },
	{ key = "v", mods = "LEADER", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "s", mods = "LEADER", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	{ key = "c", mods = "LEADER", action = act({ SpawnTab = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER", action = act({ ActivatePaneDirection = "Left" }) },
	{ key = "l", mods = "LEADER", action = act({ ActivatePaneDirection = "Right" }) },
	{ key = "j", mods = "LEADER", action = act({ ActivatePaneDirection = "Down" }) },
	{ key = "k", mods = "LEADER", action = act({ ActivatePaneDirection = "Up" }) },
	{ key = "/", mods = "LEADER", action = act.Search("CurrentSelectionOrEmptyString") },
	-- workspace selection
	{ key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES|TABS" }) },
	-- tab selection
	{ key = ",", mods = "LEADER", action = act.ShowTabNavigator },
	{ key = "n", mods = "LEADER", action = act({ ActivateTabRelative = 1 }) },
	{ key = "p", mods = "LEADER", action = act({ ActivateTabRelative = -1 }) },
	-- pane resize
	{ key = "H", mods = "LEADER", action = act({ AdjustPaneSize = { "Left", 5 } }) },
	{ key = "L", mods = "LEADER", action = act({ AdjustPaneSize = { "Right", 5 } }) },
	{ key = "K", mods = "LEADER", action = act({ AdjustPaneSize = { "Up", 5 } }) },
	{ key = "J", mods = "LEADER", action = act({ AdjustPaneSize = { "Down", 5 } }) },
}

-- tab selection by number
for i = 1, 9 do
	table.insert(K.tmux_keybinds, {
		key = tostring(i),
		mods = "LEADER",
		action = act({ ActivateTab = i - 1 }),
	})
end

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

function K.create_keybinds()
	return utils.merge_lists(K.default_keybinds, K.tmux_keybinds)
end

return K
