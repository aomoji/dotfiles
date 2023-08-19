return {
	"nvim-telescope/telescope.nvim",
	dependencies = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" }, { "mfussenegger/nvim-dap" } },
	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { ".git/" },
			},
			pickers = {
				live_grep = {
					additional_args = function(opts)
						return { "--hidden" }
					end,
				},
			},
		})
		vim.api.nvim_set_keymap("n", "<leader>ff", "<Cmd>Telescope find_files hidden=true<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>fo", "<Cmd>Telescope oldfiles<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>fb", "<Cmd>Telescope buffers<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>he", "<Cmd>Telescope help_tags<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>fc", "<Cmd>Telescope commands<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>fa", "<Cmd>Telescope marks<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>fh", "<Cmd>Telescope command_history<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>fr", "<Cmd>Telescope registers<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>gs", "<Cmd>Telescope git_status<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>bf", "<Cmd>Telescope current_buffer_fuzzy_find<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>y", "<Cmd>Telescope yank_history<CR>", { noremap = true })
	end,
	-- <C-x> go to file selection as a split
	-- <C-v> go to file selection as a vsplit
	-- <C-t> go to a file in a new tab
	--`<C-e>`: creates new file in current directory, creates new directory if the name contains a trailing '/'
}
