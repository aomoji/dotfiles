return {
	"shellRaining/hlchunk.nvim",
	commit = "f4e8e1a12e16abbd05aca216837904a02c9049a0",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("hlchunk").setup({
			chunk = { enable = true },
			indent = { enable = true },
		})
	end,
}
