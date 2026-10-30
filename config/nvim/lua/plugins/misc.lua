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
