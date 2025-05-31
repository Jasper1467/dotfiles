return {
	-- Colorscheme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},

	{ "nvim-tree/nvim-web-devicons" },

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "catppuccin",
					icons_enabled = true,
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
					globalstatus = true,
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			})
		end,
	},

	-- Telescope (fuzzy finder)
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Treesitter (syntax highlighting)
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"c",
				"cpp",
				"lua",
				"bash",
				"json",
				"python",
				"rust",
				"zig",
				"query",
				"vim",
				"vimdoc",
				"markdown",
				"markdown_inline",
			},
			auto_install = true,
			highlight = {
				enable = true,
				disable = {},
			},
			indent = {
				enable = true,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	-- LSP Config core plugin (required)
	{
		"neovim/nvim-lspconfig",
		lazy = false,
	},

	-- Mason & Mason LSPConfig for managing LSP servers
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")

			mason_lspconfig.setup({
				ensure_installed = { "clangd", "cmake" },
				handlers = {
					function(server_name) -- default handler
						lspconfig[server_name].setup({})
					end,
				},
			})

			-- Define diagnostic signs using vim.diagnostic methods (modern way)
			local signs = { Error = "", Warn = "", Hint = "", Info = "" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				-- Use the new API to define sign icons
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			-- Configure diagnostics (signs, virtual text, etc.)
			vim.diagnostic.config({
				virtual_text = {
					prefix = "●",
					spacing = 2,
				},
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})
		end,
	},

	-- clangd_extensions
	{
		"p00f/clangd_extensions.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("clangd_extensions").setup({
				inlay_hints = { enabled = true },
			})

			require("lspconfig").clangd.setup({
				cmds = {
					"clangd",
					"--clang-tidy", -- Enable clang-tidy diagnostics
					"--background-index", -- Index files in the background
					"--completion-style=detailed",
					"--header-insertion=never", -- Disable auto header insertion
				},
				flags = {
					debounce_text_changes = 150,
				},
				root_dir = require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
			})
		end,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"onsails/lspkind.nvim",
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()

			local cmp = require("cmp")
			local lspkind = require("lspkind")

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "nvim_lua" },
					{ name = "emoji" },
					{ name = "neorg" },
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text", -- "symbol" for just the icon
						maxwidth = 50,
						ellipsis_char = "...",
						menu = {},
					}),
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
			})
		end,
	},

	-- Auto pairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	-- File explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			{ "3rd/image.nvim", opts = {} },
			lazy = false,
			---@module "neo-tree"
			---@type neotree.Config?
			opts = {},
		},
		config = function()
			require("neo-tree").setup({
				filesystem = {
					filtered_items = {
						-- Show hidden files
						visible = true,
						hide_dotfiles = false,
						hide_gitignored = false,
					},
				},
			})
		end,
	},

	-- Terminal
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({})
		end,
	},

	-- Copilot
	{
		"zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
		config = function()
			require("copilot").setup({})
		end,
	},

	-- Scrollbar
	{
		"petertriho/nvim-scrollbar",
		config = function()
			require("scrollbar").setup({})
			require("scrollbar.handlers.diagnostic").setup({})
		end,
	},

	-- CMake tools
	{
		"Civitasv/cmake-tools.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local osys = require("cmake-tools.osys")
			require("cmake-tools").setup({
				cmake_command = "cmake", -- this is used to specify cmake command path
				ctest_command = "ctest", -- this is used to specify ctest command path
				cmake_use_preset = true,
				cmake_regenerate_on_save = true, -- auto generate when save CMakeLists.txt
				cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- this will be passed when invoke `CMakeGenerate`
				cmake_build_options = {}, -- this will be passed when invoke `CMakeBuild`
				-- support macro expansion:
				--       ${kit}
				--       ${kitGenerator}
				--       ${variant:xx}
				cmake_build_directory = function()
					if osys.iswin32 then
						return "out\\${variant:buildType}"
					end
					return "out/${variant:buildType}"
				end, -- this is used to specify generate directory for cmake, allows macro expansion, can be a string or a function returning the string, relative to cwd.
				cmake_compile_commands_options = {
					action = "soft_link", -- available options: soft_link, copy, lsp, none
					-- soft_link: this will automatically make a soft link from compile commands file to target
					-- copy:      this will automatically copy compile commands file to target
					-- lsp:       this will automatically set compile commands file location using lsp
					-- none:      this will make this option ignored
					target = vim.loop.cwd(), -- path to directory, this is used only if action == "soft_link" or action == "copy"
				},
				cmake_kits_path = nil, -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
				cmake_variants_message = {
					short = { show = true }, -- whether to show short message
					long = { show = true, max_length = 40 }, -- whether to show long message
				},
				cmake_dap_configuration = { -- debug settings for cmake
					name = "cpp",
					type = "codelldb",
					request = "launch",
					stopOnEntry = false,
					runInTerminal = true,
					console = "integratedTerminal",
				},
				cmake_executor = { -- executor to use
					name = "quickfix", -- name of the executor
					opts = {}, -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.
					default_opts = { -- a list of default and possible values for executors
						quickfix = {
							show = "always", -- "always", "only_on_error"
							position = "belowright", -- "vertical", "horizontal", "leftabove", "aboveleft", "rightbelow", "belowright", "topleft", "botright", use `:h vertical` for example to see help on them
							size = 10,
							encoding = "utf-8", -- if encoding is not "utf-8", it will be converted to "utf-8" using `vim.fn.iconv`
							auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
						},
						toggleterm = {
							direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
							close_on_exit = false, -- whether close the terminal when exit
							auto_scroll = true, -- whether auto scroll to the bottom
							singleton = true, -- single instance, autocloses the opened one, if present
						},
						overseer = {
							new_task_opts = {
								strategy = {
									"toggleterm",
									direction = "horizontal",
									auto_scroll = true,
									quit_on_exit = "success",
								},
							}, -- options to pass into the `overseer.new_task` command
							on_new_task = function(task)
								require("overseer").open({ enter = false, direction = "right" })
							end, -- a function that gets overseer.Task when it is created, before calling `task:start`
						},
						terminal = {
							name = "Main Terminal",
							prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
							split_direction = "horizontal", -- "horizontal", "vertical"
							split_size = 11,

							-- Window handling
							single_terminal_per_instance = true, -- Single viewport, multiple windows
							single_terminal_per_tab = true, -- Single viewport per tab
							keep_terminal_static_location = true, -- Static location of the viewport if avialable
							auto_resize = true, -- Resize the terminal if it already exists

							-- Running Tasks
							start_insert = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
							focus = false, -- Focus on terminal when cmake task is launched.
							do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.
						}, -- terminal executor uses the values in cmake_terminal
					},
				},
				cmake_runner = { -- runner to use
					name = "terminal", -- name of the runner
					opts = {}, -- the options the runner will get, possible values depend on the runner type. See `default_opts` for possible values.
					default_opts = { -- a list of default and possible values for runners
						quickfix = {
							show = "always", -- "always", "only_on_error"
							position = "belowright", -- "bottom", "top"
							size = 10,
							encoding = "utf-8",
							auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
						},
						toggleterm = {
							direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
							close_on_exit = false, -- whether close the terminal when exit
							auto_scroll = true, -- whether auto scroll to the bottom
							singleton = true, -- single instance, autocloses the opened one, if present
						},
						overseer = {
							new_task_opts = {
								strategy = {
									"toggleterm",
									direction = "horizontal",
									autos_croll = true,
									quit_on_exit = "success",
								},
							}, -- options to pass into the `overseer.new_task` command
							on_new_task = function(task) end, -- a function that gets overseer.Task when it is created, before calling `task:start`
						},
						terminal = {
							name = "Main Terminal",
							prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
							split_direction = "horizontal", -- "horizontal", "vertical"
							split_size = 11,

							-- Window handling
							single_terminal_per_instance = true, -- Single viewport, multiple windows
							single_terminal_per_tab = true, -- Single viewport per tab
							keep_terminal_static_location = true, -- Static location of the viewport if avialable
							auto_resize = true, -- Resize the terminal if it already exists

							-- Running Tasks
							start_insert = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
							focus = false, -- Focus on terminal when cmake task is launched.
							do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.
						},
					},
				},
				cmake_notifications = {
					runner = { enabled = true },
					executor = { enabled = true },
					spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- icons used for progress display
					refresh_rate_ms = 100, -- how often to iterate icons
				},
				cmake_virtual_text_support = true, -- Show the target related to current file using virtual text (at right corner)
				cmake_use_scratch_buffer = false, -- A buffer that shows what cmake-tools has done
			})
		end,
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 5000,
			render = "default",
			stages = "fade",
		},
	},
}
