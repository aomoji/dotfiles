local api = vim.api
local opt = vim.opt

-- indent
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true

-- visual
opt.list = true
opt.number = true
opt.relativenumber = true
opt.showmatch = true
opt.termguicolors = true
api.nvim_create_augroup("extra-whitespace", {})
api.nvim_create_autocmd({ "VimEnter", "WinEnter" }, {
	group = "extra-whitespace",
	pattern = { "*" },
	command = [[call matchadd('ExtraWhitespace', '[\u200B\u3000]')]],
})
api.nvim_create_autocmd({ "ColorScheme" }, {
	group = "extra-whitespace",
	pattern = { "*" },
	command = [[highlight default ExtraWhitespace ctermbg=202 ctermfg=202 guibg=salmon]],
})
opt.laststatus = 3

-- other
opt.clipboard:append({ "unnamed" })
opt.smartcase = true
vim.loader.enable()
