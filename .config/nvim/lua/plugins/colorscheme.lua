return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			--- @usage 'auto'|'main'|'moon'|'dawn'
			variant = "dawn",
			--- @usage 'main'|'moon'|'dawn'
			dark_variant = "dawn",
		})
		vim.cmd("colorscheme rose-pine")
	end,
}
