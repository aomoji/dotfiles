local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("update-right-status", function(window, domain)
	window:set_right_status(wezterm.format({
		{ Text = window:active_workspace() .. "    " },
	}))
end)

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({
		workspace = "workspace 1",
	})
	local tab, pane, window = mux.spawn_window({
		workspace = "workspace 2",
	})
	local tab, pane, window = mux.spawn_window({
		workspace = "workspace 3",
	})
end)
