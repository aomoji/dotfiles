return {
	"kdheepak/lazygit.nvim",
	config = function()
		vim.api.nvim_set_keymap("n", "<leader>git", ":LazyGit<CR>", { noremap = true })
	end,
}
