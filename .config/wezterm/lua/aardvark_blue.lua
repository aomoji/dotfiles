local M = {}

local palette = {
	foreground = "#dddddd",
	background = "#102040",
	cursor_bg = "#007acc",
	cursor_border = "#007acc",
	cursor_fg = "#bfdbfe",
	selection_bg = "#bfdbfe",
	selection_fg = "#000000",
}

local active_tab = {
	bg_color = palette.background,
	fg_color = palette.foreground,
}

local inactive_tab = {
	bg_color = palette.background,
	fg_color = palette.cursor_bg,
}

function M.colors()
	return {
		foreground = palette.foreground,
		background = palette.background,
		cursor_bg = palette.cursor_bg,
		cursor_border = palette.cursor_border,
		cursor_fg = palette.cursor_fg,
		selection_bg = palette.selection_bg,
		selection_fg = palette.selection_fg,

		ansi = {
			"#191919",
			"#aa342e",
			"#4b8c0f",
			"#dbba00",
			"#1370d3",
			"#c43ac3",
			"#008eb0",
			"#bebebe",
		},

		brights = {
			"#454545",
			"#f05b50",
			"#95dc55",
			"#ffe763",
			"#60a4ec",
			"#e26be2",
			"#60b6cb",
			"#f7f7f7",
		},

		tab_bar = {
			background = palette.background,
			active_tab = active_tab,
			inactive_tab = inactive_tab,
			inactive_tab_hover = active_tab,
			new_tab = inactive_tab,
			new_tab_hover = active_tab,
			inactive_tab_edge = palette.cursor_bg, -- (Fancy tab bar only)
		},
	}
end

function M.window_frame() -- (Fancy tab bar only)
	return {
		active_titlebar_bg = palette.background,
		inactive_titlebar_bg = palette.background,
	}
end

return M
