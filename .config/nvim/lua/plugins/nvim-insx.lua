return {
	"hrsh7th/nvim-insx",
	config = function()
		require("insx.preset.standard").setup()
		-- for fast-wrap use C-]
	end,
}
