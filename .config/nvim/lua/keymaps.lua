local api = vim.api
local g = vim.g

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
vim.keymap.set("t",  "<c-]>", [[<c-\><c-n>]]) -- for escaping terminal inside neovim
