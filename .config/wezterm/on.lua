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

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  if tab.is_active then
    return {
      { Background = { Color = "navy" } },
      { Text = " " .. tab.active_pane.title .. " " .. " - (" .. tab.active_pane.domain_name .. ")" },
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
    return {
      { Background = { Color = "maroon" } },
      { Text = " " .. tab.active_pane.title },
    }
  end
  return tab.active_pane.title
end)
