return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "cpp", "c", "lua", "vim" },
				highlight = { enabled = true },
			})
		end,
	},
	{ "tpope/vim-fugitive" },
	{ "ojroques/nvim-osc52" },
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"Civitasv/cmake-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("cmake-tools").setup({
				cmake_command = "cmake",
				cmake_build_directory = "build",
				cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
			})
		end,
	},
	{
		"mfussenegger/nvim-dap",
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "mason.nvim", "nvim-dap" },
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = { "codelldb" },
				automatic_installation = true,
			})
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			require("dapui").setup()
			local dap = require("dap")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				require("dapui").open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				require("dapui").close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				require("dapui").close()
			end
		end,
	},
	{
		"jinzhongjia/zig-lamp",
		event = "VeryLazy",
		-- Optional but recommended: build the local FFI lib to enable faster/safer verification & formatting
		build = ":ZigLampBuild async",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- For Neovim < 0.11 you’ll likely want lspconfig
			"neovim/nvim-lspconfig",
		},
		init = function()
			-- Backward-compatible global vars (all optional)
			-- Auto-install ZLS: timeout in milliseconds; set to nil to disable
			vim.g.zig_lamp_zls_auto_install = nil
			-- Fallback to system zls when no local match is found
			vim.g.zig_lamp_fall_back_sys_zls = nil
			-- Extra LSP options merged into defaults
			vim.g.zig_lamp_zls_lsp_opt = {}
			-- ZLS server settings (overrides built-in recommendations)
			vim.g.zig_lamp_zls_settings = {}
			-- Help text color for the package panel
			vim.g.zig_lamp_pkg_help_fg = "#CF5C00"
			-- Timeout (ms) used by `zig fetch` when retrieving url hashes
			vim.g.zig_lamp_zig_fetch_timeout = 5000
		end,
	},
	{
		"brenoprata10/nvim-highlight-colors",
		event = "BufReadPre",
		config = function()
			require("nvim-highlight-colors").setup({
				render = "virtual",
				virtual_symbol = "󰻂",
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		cmd = "TodoTelescope",
		event = "BufRead",
		keys = {
			{ "<leader>fd", "<cmd>TodoTelescope<cr>", desc = "Todo" },
		},
		config = function()
			require("todo-comments").setup()
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			local toggleterm = require("toggleterm")

			-- Cyberpunk neon colors for the border glow
			local neon_colors = { "#ff007f", "#ff00ff", "#00ffff", "#00ff00" }
			local cyber_bg = "#1a1a2e"
			local current_index = 1

			toggleterm.setup({
				size = 20,
				pen_mapping = [[<C-`>]],
				shade_filetypes = {},
				shade_terminals = true,
				shading_factor = 2,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				direction = "float",
				close_on_exit = true,
				shell = vim.o.shell,
				float_opts = {
					border = "rounded",
					width = 100,
					height = 30,
					winblend = 0,
					highlight = "Normal",
				},
			})

			-- Initial highlight for the floating terminal
			vim.cmd(string.format(
				[[
				hi FloatBorder guifg=%s guibg=%s
				hi NormalFloat guibg=%s guifg=#c0c0c0
			]],
				neon_colors[current_index],
				cyber_bg,
				cyber_bg
			))

			-- Timer to simulate neon glow by cycling border color
			local timer = vim.loop.new_timer()
			timer:start(
				0, -- start immediately
				500, -- interval in ms (0.5s)
				vim.schedule_wrap(function()
					current_index = current_index % #neon_colors + 1
					vim.cmd(string.format("hi FloatBorder guifg=%s guibg=%s", neon_colors[current_index], cyber_bg))
				end)
			)
		end,
	},
	{
		"folke/snacks.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("snacks").setup({
				notifier = { enabled = true },
				words = { enabled = true },
				lazygit = {
					configure = false,
					win = {
						position = "float",
						width = 0.99,
						height = 0.99,
					},
				},
				terminal = {
					win = {
						position = "right",
						width = 0.5,
						wo = {
							winbar = "", -- hide terminal title
						},
					},
				},
				picker = {
					formatters = {
						file = {
							filename_first = true,
						},
					},
					prompt = "   ",
				},
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			local comment = require("Comment")
			comment.setup({
				padding = true, -- space between comment and line
				sticky = true, -- keeps cursor position
			})

			-- Super + C to comment current line (insert mode)
			vim.keymap.set("n", "<D-c>", function()
				comment.api.toggle.linewise.current()
			end, { noremap = true, silent = true })

			-- Super + C to comment current line (normal mode)
			vim.keymap.set("n", "<D-c>", function()
				comment.api.toggle.linewise.current()
			end, { noremap = true, silent = true })

			-- Super + C in visual mode to comment selection
			vim.keymap.set("v", "<D-c>", function()
				comment.api.toggle.linewise(vim.fn.visualmode())
			end, { noremap = true, silent = true })
		end,
	},
}
