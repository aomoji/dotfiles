-- return {
-- 	"glepnir/galaxyline.nvim",
-- 	-- your statusline
-- 	config = function()
-- 		require("galaxyline.themes.eviline")
-- 	end,
-- 	-- some optional icons
-- 	dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
-- }

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	config = function()
		require("lualine").setup({
			options = { theme = "papercolor_light" },
		})
	end,
}
