return {
	"petertriho/nvim-scrollbar",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"kevinhwang91/nvim-hlslens",
	},
	config = function()
		require("scrollbar").setup()
		require("scrollbar.handlers.gitsigns").setup()
		require("scrollbar.handlers.search").setup({
            override_lens = function() end,
        })
	end,
}
