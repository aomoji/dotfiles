return {
	"ur4ltz/surround.nvim",
	-- 単語選択→囲む：viw→s<char>
	-- 他の文字で囲む：sr<from><to>
	-- 囲み文字を削除する：sd<char>
	config = function()
		require("surround").setup({})
	end,
}
