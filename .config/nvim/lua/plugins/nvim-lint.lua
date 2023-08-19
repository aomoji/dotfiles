return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			sql = { "sqlfluff" },
			sh = { "shellcheck" },
			yaml = { "yamllint" },
			python = { "pydocstyle", "pyflakes" },
		}
	end,
}
