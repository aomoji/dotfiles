return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
		local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/")
		local codelldb_path = mason_path .. "adapter/codelldb"
		dap.adapters.python = {
			type = "server",
			command = "~/.local/share/nvim/mason/bin/debugpy",
			args = { "--listen", "5678" },
		}
		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "launch file",
				program = "${file}",
				pythonpath = function()
					return os.getenv("HOME") .. "/opt/anaconda3/bin/python"
				end,
			},
		}
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				-- CHANGE THIS to your path!
				command = codelldb_path,
				args = { "--port", "${port}" },

				-- On windows you may have to uncomment this:
				-- detached = false,
			},
		}
		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}
		vim.api.nvim_set_keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", { noremap = false })
		vim.api.nvim_set_keymap("n", "<F10>", "<cmd>lua require'dap'.step_over()<cr>", { noremap = false })
		vim.api.nvim_set_keymap("n", "<F11>", "<cmd>lua require'dap'.step_into()<cr>", { noremap = false })
		vim.api.nvim_set_keymap("n", "<F12>", "<cmd>lua require'dap'.step_out()<cr>", { noremap = false })
		vim.api.nvim_set_keymap("n", "<leader>B", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { noremap = false })
	end,
}
