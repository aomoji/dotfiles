return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- optional, for file icon
	},
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 40,
			},
		})
		vim.api.nvim_set_keymap("n", "<leader>fl", ":NvimTreeToggle<CR>", { noremap = true })
	end,
}
