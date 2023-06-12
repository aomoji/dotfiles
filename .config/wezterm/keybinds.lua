-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
local act_cb = wezterm.action_callback
local utils = require("utils")

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
	{ key = "t", mods = "LEADER", action = act.ShowTabNavigator },
	{ key = "n", mods = "LEADER", action = act({ ActivateTabRelative = 1 }) },
	{ key = "p", mods = "LEADER", action = act({ ActivateTabRelative = -1 }) },
	-- pane
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	-- rename tab title
	{
		key = ",",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = act_cb(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	-- QuickSelect
	{ key = "y", mods = "LEADER", action = "QuickSelect" },
	-- rename tab title
	{
		key = "$",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "Enter new name for workspace",
			action = act_cb(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					mux.rename_workspace(mux.get_active_workspace(), line)
				end
			end),
		}),
	},
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
