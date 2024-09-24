local wezterm = require("wezterm")
local mux = wezterm.mux

local function battery_status()
	local bat = ""
	for _, b in ipairs(wezterm.battery_info()) do
		local percentage = b.state_of_charge * 100
		local space = "  "

		if b.state == "Charging" then
			if 0 <= percentage and percentage < 10 then
				bat = wezterm.nerdfonts.md_battery_charging_10 .. space
			elseif 10 <= percentage and percentage < 20 then
				bat = wezterm.nerdfonts.md_battery_charging_20 .. space
			elseif 20 <= percentage and percentage < 30 then
				bat = wezterm.nerdfonts.md_battery_charging_30 .. space
			elseif 30 <= percentage and percentage < 40 then
				bat = wezterm.nerdfonts.md_battery_charging_40 .. space
			elseif 40 <= percentage and percentage < 50 then
				bat = wezterm.nerdfonts.md_battery_charging_50 .. space
			elseif 50 <= percentage and percentage < 60 then
				bat = wezterm.nerdfonts.md_battery_charging_60 .. space
			elseif 60 <= percentage and percentage < 70 then
				bat = wezterm.nerdfonts.md_battery_charging_70 .. space
			elseif 70 <= percentage and percentage < 80 then
				bat = wezterm.nerdfonts.md_battery_charging_80 .. space
			elseif 80 <= percentage and percentage < 90 then
				bat = wezterm.nerdfonts.md_battery_charging_90 .. space
			else
				bat = wezterm.nerdfonts.md_battery_charging_100 .. space
			end
		else
			if 0 <= percentage and percentage < 10 then
				bat = wezterm.nerdfonts.md_battery_10 .. space
			elseif 10 <= percentage and percentage < 20 then
				bat = wezterm.nerdfonts.md_battery_20 .. space
			elseif 20 <= percentage and percentage < 30 then
				bat = wezterm.nerdfonts.md_battery_30 .. space
			elseif 30 <= percentage and percentage < 40 then
				bat = wezterm.nerdfonts.md_battery_40 .. space
			elseif 40 <= percentage and percentage < 50 then
				bat = wezterm.nerdfonts.md_battery_50 .. space
			elseif 50 <= percentage and percentage < 60 then
				bat = wezterm.nerdfonts.md_battery_60 .. space
			elseif 60 <= percentage and percentage < 70 then
				bat = wezterm.nerdfonts.md_battery_70 .. space
			elseif 70 <= percentage and percentage < 80 then
				bat = wezterm.nerdfonts.md_battery_80 .. space
			elseif 80 <= percentage and percentage < 90 then
				bat = wezterm.nerdfonts.md_battery_90 .. space
			else
				bat = wezterm.nerdfonts.md_battery .. space
			end
		end

		bat = bat .. string.format("%.0f%%", percentage)
	end
	return bat
end

local function segments_for_right_status(window)
	return {
		window:active_workspace(),
		wezterm.strftime("%Y-%m-%d %a %H:%M"),
		battery_status(),
	}
end

wezterm.on("update-status", function(window, _)
	local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	local segments = segments_for_right_status(window)

	local color_scheme = window:effective_config().resolved_palette
	-- Note the use of wezterm.color.parse here, this returns
	-- a Color object, which comes with functionality for lightening
	-- or darkening the colour (amongst other things).
	local bg = wezterm.color.parse(color_scheme.background)
	local fg = color_scheme.foreground

	-- Each powerline segment is going to be coloured progressively
	-- darker/lighter depending on whether we're on a dark/light colour
	-- scheme. Let's establish the "from" and "to" bounds of our gradient.
	local gradient_to = bg
	local gradient_from = gradient_to:lighten(0.4)

	-- Yes, WezTerm supports creating gradients, because why not?! Although
	-- they'd usually be used for setting high fidelity gradients on your terminal's
	-- background, we'll use them here to give us a sample of the powerline segment
	-- colours we need.
	local gradient = wezterm.color.gradient(
		{
			orientation = "Horizontal",
			colors = { gradient_from, gradient_to },
		},
		#segments -- only gives us as many colours as we have segments.
	)

	-- We'll build up the elements to send to wezterm.format in this table.
	local elements = {}

	for i, seg in ipairs(segments) do
		local is_first = i == 0

		if is_first then
			table.insert(elements, { Background = { Color = "none" } })
		end
		table.insert(elements, { Foreground = { Color = gradient[i] } })
		table.insert(elements, { Text = SOLID_LEFT_ARROW })

		table.insert(elements, { Background = { Color = gradient[i] } })
		table.insert(elements, { Foreground = { Color = fg } })
		table.insert(elements, { Text = "   " .. seg .. "   " })
	end

	window:set_right_status(wezterm.format(elements))
end)

wezterm.on("gui-startup", function()
	local _, _, _ = mux.spawn_window({
		workspace = "workspace 1",
	})
	local _, _, _ = mux.spawn_window({
		workspace = "workspace 2",
	})
	local _, _, _ = mux.spawn_window({
		workspace = "workspace 3",
	})
end)

local function tab_title(tab_info)
	local title = tab_info.tab_title
	local index = tab_info.tab_index + 1
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return index .. "  " .. title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab)
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
