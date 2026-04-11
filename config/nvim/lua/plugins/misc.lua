return {
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
		"jinzhongjia/zig-lamp",
		event = "VeryLazy",
		build = ":ZigLampBuild async",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- For Neovim < 0.11 you’ll likely want lspconfig
			"neovim/nvim-lspconfig",
		},
		init = function()
			vim.g.zig_lamp_zls_auto_install = nil
			vim.g.zig_lamp_fall_back_sys_zls = nil
			vim.g.zig_lamp_zls_lsp_opt = {}
			vim.g.zig_lamp_zls_settings = {}
			vim.g.zig_lamp_pkg_help_fg = "#CF5C00"
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
}
