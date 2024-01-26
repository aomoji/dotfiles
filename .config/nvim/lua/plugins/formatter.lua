return {
	"mhartington/formatter.nvim",
	config = function()
		vim.api.nvim_set_keymap("n", "<leader>fm", ":Format<CR>", { noremap = true })
		-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
		require("formatter").setup({
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.WARN,
			-- All formatter configurations are opt-in
			filetype = {
				-- Formatter configurations for filetype "lua" go here
				-- and will be executed in order
				lua = {
					-- "formatter.filetypes.lua" defines default configurations for the
					-- "lua" filetype
					require("formatter.filetypes.lua").stylua,
				},
				yaml = { require("formatter.filetypes.yaml").yamlfmt },
				rust = { require("formatter.filetypes.rust").rustfmt },
				sh = { require("formatter.filetypes.sh").shfmt },
				markdown = { require("formatter.filetypes.markdown").markdownlint},
				sql = {
					function()
						return {
							exe = "sqlfmt",
							args = { "-" },
							stdin = true,
						}
					end,
				},
				python = { require("formatter.filetypes.python").black },
				-- Use the special "*" filetype for defining formatter configurations on
				-- any filetype
				["*"] = {
					-- "formatter.filetypes.any" defines default configurations for any
					-- filetype
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
