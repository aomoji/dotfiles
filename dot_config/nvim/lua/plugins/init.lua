return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
        --
        --    Old text                    Command         New text
        ----------------------------------------------------------------------
        -- surr*ound_words             ysiw)           (surround_words)
        -- *make strings               ys$"            "make strings"
        -- *visual selection*          S)              (visual selection)
        -- [delete ar*ound me!]        ds]             delete around me!
        -- remove <b>HTML t*ags</b>    dst             remove HTML tags
        -- 'change quot*es'            cs'"            "change quotes"
        -- <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
        -- delete(functi*on calls)     dsf             function calls
      }
    end,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        "<leader>j",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
    },
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      return require "configs.telescope"
    end,
  },
  {
    "stevearc/quicker.nvim",
    config = function()
      require("quicker").setup {
        -- Local options to set for quickfix
        opts = {
          buflisted = false,
          number = false,
          relativenumber = false,
          signcolumn = "auto",
          winfixheight = true,
          wrap = false,
        },
        -- Set to false to disable the default options in `opts`
        use_default_opts = true,
        -- Keymaps to set for the quickfix buffer
        keys = {
          -- { ">", "<cmd>lua require('quicker').expand()<CR>", desc = "Expand quickfix content" },
        },
        -- Callback function to run any custom logic or keymaps for the quickfix buffer
        on_qf = function(bufnr) end,
        edit = {
          -- Enable editing the quickfix like a normal buffer
          enabled = true,
          -- Set to true to write buffers after applying edits.
          -- Set to "unmodified" to only write unmodified buffers.
          autosave = "unmodified",
        },
        -- Keep the cursor to the right of the filename and lnum columns
        constrain_cursor = true,
        highlight = {
          -- Use treesitter highlighting
          treesitter = true,
          -- Use LSP semantic token highlighting
          lsp = true,
          -- Load the referenced buffers to apply more accurate highlights (may be slow)
          load_buffers = false,
        },
        follow = {
          -- When quickfix window is open, scroll to closest item to the cursor
          enabled = false,
        },
        -- Map of quickfix item type to icon
        type_icons = {
          E = "󰅚 ",
          W = "󰀪 ",
          I = " ",
          N = " ",
          H = " ",
        },
        -- Border characters
        borders = {
          vert = "┃",
          -- Strong headers separate results from different files
          strong_header = "━",
          strong_cross = "╋",
          strong_end = "┫",
          -- Soft headers separate results within the same file
          soft_header = "╌",
          soft_cross = "╂",
          soft_end = "┨",
        },
        -- How to trim the leading whitespace from results. Can be 'all', 'common', or false
        trim_leading_whitespace = "common",
        -- Maximum width of the filename column
        max_filename_width = function()
          return math.floor(math.min(95, vim.o.columns / 2))
        end,
        -- How far the header should extend to the right
        header_length = function(type, start_col)
          return vim.o.columns - start_col
        end,
      }
    end,
    event = "FileType qf",
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {},
  },
}
