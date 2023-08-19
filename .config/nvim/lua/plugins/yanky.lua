return {
	"gbprod/yanky.nvim",
	config = function()
		local mapping = require("yanky.telescope.mapping")
		require("telescope").load_extension("yank_history")
		require("yanky").setup({
			ring = {
				history_length = 100,
				storage = "shada",
				sync_with_numbered_registers = true,
				cancel_event = "update",
				ignore_registers = { "_" },
			},
			system_clipboard = {
				sync_with_ring = true,
			},
			picker = {
				telescope = {
					use_default_mappings = false,
					mappings = {
						i = {
							["<Enter>"] = mapping.put("p"),
							["<s-Enter>"] = mapping.put("P"),
							["<c-b>"] = mapping.put("gp"),
							["<c-a>"] = mapping.put("gP"),
						},
					},
				},
			},
		})
	end,
}
