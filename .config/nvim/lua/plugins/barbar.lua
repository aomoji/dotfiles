return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup({})
		vim.api.nvim_set_keymap("n", "<C-p>", "<Cmd>BufferLineCyclePrev<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<C-n>", "<Cmd>BufferLineCycleNext<CR>", { noremap = true })
        -- Close current buffer
		vim.keymap.set("n", "<leader>cc", function()
			local buffer_id = vim.fn.bufnr()
			if buffer_id then
				vim.cmd("BufferLineCyclePrev")
				vim.cmd("bdelete " .. buffer_id)
			end
		end)
		vim.api.nvim_set_keymap("n", "<leader>cl", "<Cmd>BufferLinePickClose<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>gb", "<Cmd>BufferLinePick<CR>", { noremap = true })
	end,
}
