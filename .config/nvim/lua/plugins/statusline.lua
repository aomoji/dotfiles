return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	config = function()
		require("lualine").setup({
			options = { theme = "papercolor_light", globalstatus = true },
		})
	end,
}
