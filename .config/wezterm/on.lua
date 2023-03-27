local wezterm = require("wezterm")

wezterm.on("update-right-status", function(window)
  window:set_right_status(window:active_workspace())
end)
