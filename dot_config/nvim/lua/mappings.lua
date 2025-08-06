require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local api = vim.api

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

api.nvim_set_keymap("n", "j", "gj", { noremap = true })
api.nvim_set_keymap("n", "k", "gk", { noremap = true })
api.nvim_set_keymap("n", "0", "g0", { noremap = true })
api.nvim_set_keymap("n", "$", "g$", { noremap = true })
