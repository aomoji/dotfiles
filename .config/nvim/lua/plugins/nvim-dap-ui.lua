return {
	"rcarriga/nvim-dap-ui",
	config = function()
		vim.api.nvim_set_keymap("n", "<leader>ds", "<cmd>lua require('dapui').setup()<cr>", { noremap = false })
		vim.api.nvim_set_keymap("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<cr>", { noremap = false })
		vim.api.nvim_set_keymap("n", "<leader>de", "<cmd>lua require('dapui').eval()<cr>", { noremap = false })
		local dap, dapui = require("dap"), require("dapui")
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
	dependencies = {
		"mfussenegger/nvim-dap",
	},
}
