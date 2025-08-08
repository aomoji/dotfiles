require("nvchad.configs.lspconfig").defaults()

local servers = { "pyright", "lua_ls", "rust_analyzer", "sqlls", "terraform_lsp", "tflint", "bashls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
