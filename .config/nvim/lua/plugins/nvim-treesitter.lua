return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "VeryLazy",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "bash", "fish", "python", "scala", "rust", "lua", "sql" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
			ignore_install = { "javascript" }, -- List of parsers to ignore installing
			sync_install = true,
			auto_install = true,
			highlight = {
				enable = true, -- false will disable the whole extension
				disable = { "javascript" }, -- list of language that will be disabled
				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
