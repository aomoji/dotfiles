return {
	"romgrk/barbar.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "lewis6991/gitsigns.nvim" },
	config = function()
		vim.api.nvim_set_keymap("n", "<C-p>", "<Cmd>BufferPrevious<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<C-n>", "<Cmd>BufferNext<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<C-c>", "<Cmd>BufferPickDelete<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>r", "<Cmd>BufferRestore<CR>", { noremap = true })
	end,
}
