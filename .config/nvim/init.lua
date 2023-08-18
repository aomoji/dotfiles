local api = vim.api
local g = vim.g
local opt = vim.opt

-- plugins
require("plugins")

-- keymap
g.mapleader = " " -- leader key
api.nvim_set_keymap("n", ";", ":", { noremap = true }) -- swap ; and :
api.nvim_set_keymap("n", ":", ";", { noremap = true }) -- swap ; and :
api.nvim_set_keymap("n", "j", "gj", { noremap = true })
api.nvim_set_keymap("n", "k", "gk", { noremap = true })
api.nvim_set_keymap("n", "0", "g0", { noremap = true })
api.nvim_set_keymap("n", "$", "g$", { noremap = true })
api.nvim_set_keymap("i", "<c-h>", "<Left>", { noremap = true }) -- enable to move cursor in insert mode
api.nvim_set_keymap("i", "<c-j>", "<Down>", { noremap = true }) -- enable to move cursor in insert mode
api.nvim_set_keymap("i", "<c-k>", "<Up>", { noremap = true }) -- enable to move cursor in insert mode
api.nvim_set_keymap("i", "<c-l>", "<Right>", { noremap = true }) -- enable to move cursor in insert mode
api.nvim_set_keymap("n", "<ESC><ESC>", ":nohl<CR>", { noremap = true }) -- disable search highlight

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

-- other
opt.clipboard:append({ "unnamed" })
opt.smartcase = true
vim.loader.enable()
