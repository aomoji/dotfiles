return {
	"heavenshell/vim-pydocstring",
	config = function()
		vim.cmd("let g:pydocstring_doq_path = '~/.pyenv/shims/doq'")
		vim.cmd("let g:pydocstring_formatter = 'numpy'")
		vim.api.nvim_set_keymap("n", "<leader>pd", "<Cmd>Pydocstring<CR>", { noremap = true })
	end,
	ft = { "python" },
}
