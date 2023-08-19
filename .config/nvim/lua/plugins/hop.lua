return {
	"phaazon/hop.nvim",
	branch = "v2", -- optional but strongly recommended
	config = function()
		-- you can configure Hop the way you like here; see :h hop-config
		require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		vim.api.nvim_set_keymap("n", "<leader>hw", ":HopWord<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>hp", ":HopPattern<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>ha", ":HopAnywhere<CR>", { noremap = true })
	end,
}
