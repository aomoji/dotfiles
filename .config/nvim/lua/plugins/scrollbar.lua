return {
	"Xuyuanp/scrollbar.nvim",
	config = function()
		vim.cmd("autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()")
		vim.cmd("autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()")
		vim.cmd("autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()")
	end,
}
