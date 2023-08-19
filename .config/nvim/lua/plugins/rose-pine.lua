return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			--- @usage 'auto'|'main'|'moon'|'dawn'
			variant = "moon",
			--- @usage 'main'|'moon'|'dawn'
			dark_variant = "moon",
		})
		vim.cmd("colorscheme rose-pine")
	end,
}
