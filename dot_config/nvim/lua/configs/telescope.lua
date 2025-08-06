local default_configs = require "nvchad.configs.telescope"
local actions = require "telescope.actions"

local my_configs = {
  defaults = {
    mappings = {
      i = {
        ["<C-a>"] = function(prompt_bufnr)
          actions.send_to_qflist(prompt_bufnr)
          actions.open_qflist(prompt_bufnr)
        end,
        ["<C-o>"] = function(prompt_bufnr)
          actions.send_selected_to_qflist(prompt_bufnr)
          actions.open_qflist(prompt_bufnr)
        end,
      },
    },
  },
}

return vim.tbl_deep_extend("force", default_configs, my_configs)
