return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- optional, for file icon
	},
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 30,
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					git_placement = "signcolumn",
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
				},
			},
		})
		vim.api.nvim_set_keymap("n", "<leader>fl", ":NvimTreeToggle<CR>", { noremap = true })
	end,
}
