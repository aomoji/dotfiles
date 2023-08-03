-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()
return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"heavenshell/vim-pydocstring",
		config = function()
			vim.cmd("let g:pydocstring_doq_path = '~/opt/anaconda3/bin/doq'")
			vim.cmd("let g:pydocstring_formatter = 'numpy'")
			vim.api.nvim_set_keymap("n", "<leader>pd", "<Cmd>Pydocstring<CR>", { noremap = true })
		end,
		ft = { "python" },
	})

	use({ "davidgranstrom/nvim-markdown-preview" })

	use({
		"nvim-treesitter/nvim-treesitter",
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
		run = ":TSUpdate",
	})

	use({ "nvim-tree/nvim-web-devicons" })

	use({
		"NTBBloodbath/galaxyline.nvim",
		-- your statusline
		config = function()
			require("galaxyline.themes.eviline")
		end,
		-- some optional icons
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	use({
		"hrsh7th/nvim-insx",
		config = function()
			require("insx.preset.standard").setup()
			-- for fast-wrap use C-]
		end,
	})

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use({
		"ur4ltz/surround.nvim",
		-- 単語選択→囲む：viw→s<char>
		-- 他の文字で囲む：sr<from><to>
		-- 囲み文字を削除する：sd<char>
		config = function()
			require("surround").setup({})
		end,
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			vim.opt.list = true
			require("indent_blankline").setup({
				space_char_blankline = " ",
				show_current_context = true,
				show_current_context_start = true,
			})
		end,
	})

	use({
		"beauwilliams/focus.nvim",
		config = function()
			require("focus").setup()
			local ignore_filetypes = { "NvimTree" }
			local ignore_buftypes = {}

			local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })

			vim.api.nvim_create_autocmd("WinEnter", {
				group = augroup,
				callback = function(_)
					if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
						vim.b.focus_disable = true
					end
				end,
				desc = "Disable focus autoresize for BufType",
			})

			vim.api.nvim_create_autocmd("FileType", {
				group = augroup,
				callback = function(_)
					if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
						vim.b.focus_disable = true
					end
				end,
				desc = "Disable focus autoresize for FileType",
			})
		end,
	})

	use({
		"Xuyuanp/scrollbar.nvim",
		config = function()
			vim.cmd("autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()")
			vim.cmd("autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()")
			vim.cmd(
				"autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()"
			)
		end,
	})

	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			require("rose-pine").setup({
				--- @usage 'auto'|'main'|'moon'|'dawn'
				variant = "main",
				--- @usage 'main'|'moon'|'dawn'
				dark_variant = "main",
			})
			vim.cmd("colorscheme rose-pine")
		end,
	})

	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icon
		},
		after = { "focus.nvim" },
		config = function()
			require("nvim-tree").setup({
				view = {
					width = 40,
				},
			})
			vim.api.nvim_set_keymap("n", "<leader>fl", ":NvimTreeToggle<CR>", { noremap = true })
		end,
	})

	use({
		"romgrk/barbar.nvim",
		requires = { "nvim-tree/nvim-web-devicons", "lewis6991/gitsigns.nvim" },
		config = function()
			vim.api.nvim_set_keymap("n", "<C-p>", "<Cmd>BufferPrevious<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<C-n>", "<Cmd>BufferNext<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<C-c>", "<Cmd>BufferPickDelete<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>r", "<Cmd>BufferRestore<CR>", { noremap = true })
		end,
	})

	use({
		"RRethy/vim-illuminate",
		config = function()
			-- default configuration
			require("illuminate").configure({
				-- providers: provider used to get references in the buffer, ordered by priority
				providers = {
					"lsp",
					"treesitter",
					"regex",
				},
				-- delay: delay in milliseconds
				delay = 100,
				-- filetype_overrides: filetype specific overrides.
				-- The keys are strings to represent the filetype while the values are tables that
				-- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
				filetype_overrides = {},
				-- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
				filetypes_denylist = {
					"dirvish",
					"fugitive",
				},
				-- filetypes_allowlist: filetypes to illuminate, this is overriden by filetypes_denylist
				filetypes_allowlist = {},
				-- modes_denylist: modes to not illuminate, this overrides modes_allowlist
				-- See `:help mode()` for possible values
				modes_denylist = {},
				-- modes_allowlist: modes to illuminate, this is overriden by modes_denylist
				-- See `:help mode()` for possible values
				modes_allowlist = {},
				-- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
				-- Only applies to the 'regex' provider
				-- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
				providers_regex_syntax_denylist = {},
				-- providers_regex_syntax_allowlist: syntax to illuminate, this is overriden by providers_regex_syntax_denylist
				-- Only applies to the 'regex' provider
				-- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
				providers_regex_syntax_allowlist = {},
				-- under_cursor: whether or not to illuminate under the cursor
				under_cursor = true,
				-- large_file_cutoff: number of lines at which to use large_file_config
				-- The `under_cursor` option is disabled when this cutoff is hit
				large_file_cutoff = nil,
				-- large_file_config: config to use for large files (based on large_file_cutoff).
				-- Supports the same keys passed to .configure
				-- If nil, vim-illuminate will be disabled for large files.
				large_file_overrides = nil,
				-- min_count_to_highlight: minimum number of matches required to perform highlighting
				min_count_to_highlight = 1,
			})
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup()
		end,
	})

	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	use({
		-- Usage: https://github.com/numToStr/Comment.nvim#-usage
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use({
		"kdheepak/lazygit.nvim",
		config = function()
			vim.api.nvim_set_keymap("n", "<leader>git", ":LazyGit<CR>", { noremap = true })
		end,
	})

	use({
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/")
			local codelldb_path = mason_path .. "adapter/codelldb"
			dap.adapters.python = {
				type = "server",
				command = "~/.local/share/nvim/mason/bin/debugpy",
				args = { "--listen", "5678" },
			}
			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "launch file",
					program = "${file}",
					pythonpath = function()
						return os.getenv("HOME") .. "/opt/anaconda3/bin/python"
					end,
				},
			}
			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					-- CHANGE THIS to your path!
					command = codelldb_path,
					args = { "--port", "${port}" },

					-- On windows you may have to uncomment this:
					-- detached = false,
				},
			}
			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}
			vim.api.nvim_set_keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", { noremap = false })
			vim.api.nvim_set_keymap("n", "<F10>", "<cmd>lua require'dap'.step_over()<cr>", { noremap = false })
			vim.api.nvim_set_keymap("n", "<F11>", "<cmd>lua require'dap'.step_into()<cr>", { noremap = false })
			vim.api.nvim_set_keymap("n", "<F12>", "<cmd>lua require'dap'.step_out()<cr>", { noremap = false })
			vim.api.nvim_set_keymap(
				"n",
				"<leader>B",
				"<cmd>lua require'dap'.toggle_breakpoint()<cr>",
				{ noremap = false }
			)
		end,
	})

	use({
		"jay-babu/mason-nvim-dap.nvim",
		after = { "mason.nvim", "nvim-dap" },
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = { "python", "codelldb" },
				handlers = {},
			})
		end,
	})

	use({
		"mg979/vim-visual-multi",
		config = function()
			vim.cmd("let g:VM_maps = {}")
			vim.cmd("let g:VM_maps['Find Under'] = '<leader>m'")
			-- * select words with Ctrl-N (like Ctrl-d in Sublime Text/VS Code)
			-- * create cursors vertically with Ctrl-Down/Ctrl-Up
			-- * select one character at a time with Shift-Arrows
			-- * press n/N to get next/previous occurrence
			-- * press [/] to select next/previous cursor
			-- * press q to skip current and get next occurrence
			-- * press Q to remove current cursor/selection
			-- * start insert mode with i,a,I,A
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" }, { "mfussenegger/nvim-dap" } },
		config = function()
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = { ".git/" },
				},
			})
			vim.api.nvim_set_keymap("n", "<leader>ff", "<Cmd>Telescope find_files hidden=true<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>fo", "<Cmd>Telescope oldfiles<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>fb", "<Cmd>Telescope buffers<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>he", "<Cmd>Telescope help_tags<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>fc", "<Cmd>Telescope commands<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>fa", "<Cmd>Telescope marks<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>fh", "<Cmd>Telescope command_history<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>fr", "<Cmd>Telescope registers<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>gs", "<Cmd>Telescope git_status<CR>", { noremap = true })
			vim.api.nvim_set_keymap(
				"n",
				"<leader>bf",
				"<Cmd>Telescope current_buffer_fuzzy_find<CR>",
				{ noremap = true }
			)
			vim.api.nvim_set_keymap("n", "<leader>y", "<Cmd>Telescope yank_history<CR>", { noremap = true })
		end,
		-- <C-x> go to file selection as a split
		-- <C-v> go to file selection as a vsplit
		-- <C-t> go to a file in a new tab
		--`<C-e>`: creates new file in current directory, creates new directory if the name contains a trailing '/'
	})

	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
			vim.api.nvim_set_keymap("n", "<leader>hw", ":HopWord<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>hp", ":HopPattern<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>ha", ":HopAnywhere<CR>", { noremap = true })
		end,
	})

	use({
		"gbprod/yanky.nvim",
		config = function()
			local mapping = require("yanky.telescope.mapping")
			require("telescope").load_extension("yank_history")
			require("yanky").setup({
				ring = {
					history_length = 100,
					storage = "shada",
					sync_with_numbered_registers = true,
					cancel_event = "update",
					ignore_registers = { "_" },
				},
				system_clipboard = {
					sync_with_ring = true,
				},
				picker = {
					telescope = {
						use_default_mappings = false,
						mappings = {
							i = {
								["<Enter>"] = mapping.put("p"),
								["<s-Enter>"] = mapping.put("P"),
								["<c-b>"] = mapping.put("gp"),
								["<c-a>"] = mapping.put("gP"),
							},
						},
					},
				},
			})
		end,
	})

	use({
		"rcarriga/nvim-dap-ui",
		config = function()
			vim.api.nvim_set_keymap("n", "<leader>ds", "<cmd>lua require('dapui').setup()<cr>", { noremap = false })
			vim.api.nvim_set_keymap("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<cr>", { noremap = false })
			vim.api.nvim_set_keymap("n", "<leader>de", "<cmd>lua require('dapui').eval()<cr>", { noremap = false })
			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
		requires = {
			"mfussenegger/nvim-dap",
		},
	})

	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})

	use({
		"williamboman/mason-lspconfig.nvim",
		after = "mason.nvim",
		config = function()
			require("mason-lspconfig").setup()
		end,
	})

	use({
		"neovim/nvim-lspconfig",
		after = "mason-lspconfig.nvim",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				flags = lsp_flags,
				Lua = {
					workspace = {
						maxPreload = 10000,
						preloadFileSize = 1000,
					},
				},
			})
			lspconfig.pyright.setup({
				on_attach = on_attach,
				flags = lsp_flags,
			})
			lspconfig.rust_analyzer.setup({
				on_attach = on_attach,
				flags = lsp_flags,
				-- Server-specific settings...
				settings = {
					["rust-analyzer"] = {},
				},
			})
			lspconfig.bashls.setup({
				on_attach = on_attach,
				flags = lsp_flags,
			})
			lspconfig.sqlls.setup({
				on_attach = on_attach,
				flags = lsp_flags,
			})
			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<space>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.diagnostic.config({ virtual_text = false })
				end,
			})
		end,
	})

	use({
		"mhartington/formatter.nvim",
		config = function()
			vim.api.nvim_set_keymap("n", "<leader>fm", ":Format<CR>", { noremap = true })
			-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
			require("formatter").setup({
				-- Enable or disable logging
				logging = true,
				-- Set the log level
				log_level = vim.log.levels.WARN,
				-- All formatter configurations are opt-in
				filetype = {
					-- Formatter configurations for filetype "lua" go here
					-- and will be executed in order
					lua = {
						-- "formatter.filetypes.lua" defines default configurations for the
						-- "lua" filetype
						require("formatter.filetypes.lua").stylua,
					},
					yaml = { require("formatter.filetypes.yaml").yamlfmt },
					rust = { require("formatter.filetypes.rust").rustfmt },
					sh = { require("formatter.filetypes.sh").shfmt },
					sql = {
						function()
							return {
								exe = "sqlfmt",
								args = { "-" },
								stdin = true,
							}
						end,
					},
					python = { require("formatter.filetypes.python").black },
					-- Use the special "*" filetype for defining formatter configurations on
					-- any filetype
					["*"] = {
						-- "formatter.filetypes.any" defines default configurations for any
						-- filetype
						require("formatter.filetypes.any").remove_trailing_whitespace,
					},
				},
			})
		end,
	})

	use({
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				sql = { "sqlfluff" },
				sh = { "shellcheck" },
				yaml = { "yamllint" },
				python = { "pydocstyle", "pyflakes" },
			}
		end,
	})

	use({
		"hrsh7th/nvim-cmp",
		after = "nvim-lspconfig",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"neovim/nvim-lspconfig",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "path" },
					{ name = "buffer" },
					{ name = "cmdline" },
					{ name = "git" },
				}),
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
			})
			-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			local lspconfig = require("lspconfig")
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
			})
		end,
	})

	use({
		"thinca/vim-qfreplace",
		-- grep -> select -> ctr-q -> Qfreplace -> edit&save
	})
end)
