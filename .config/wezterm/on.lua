local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("update-right-status", function(window, domain)
	window:set_right_status(wezterm.format({
		{ Foreground = { Color = "#ea9d34" } },
		{ Text = "    " .. window:active_workspace() .. "    " },
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

function tab_title(tab_info)
	local title = tab_info.tab_title
	local index = tab_info.tab_index + 1
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return "[ " .. index .. " ]" .. "  ▷  " .. title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	if tab.is_active then
		local title = tab_title(tab)
		return {
			{ Text = " " .. title .. " " },
		}
	end
	local has_unseen_output = false
	for _, pane in ipairs(tab.panes) do
		if pane.has_unseen_output then
			has_unseen_output = true
			break
		end
	end
	if has_unseen_output then
		local title = tab_title(tab)
		return {
			{ Text = " " .. title },
		}
	end
	return tab_title(tab)
end)
