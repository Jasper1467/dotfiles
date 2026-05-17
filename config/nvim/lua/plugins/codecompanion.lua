return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("codecompanion").setup({
				adapters = {
					ollama = function()
						return require("codecompanion.adapters").extend("ollama", {
							name = "ollama",
							schema = {
								model = {
									default = "qwen2.5-coder:14b",
								},
							},
						})
					end,
				},

				strategies = {
					chat = {
						adapter = "ollama",
					},
					inline = {
						adapter = "ollama",
					},
					agent = {
						adapter = "ollama",
					},
				},

                vim.keymap.set({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionActions<cr>"),
                vim.keymap.set({ "n", "v" }, "<leader>ac", "<cmd>CodeCompanionChat<cr>"),
                vim.keymap.set("v", "<leader>ae", "<cmd>CodeCompanion<cr>")
			})
		end,
	},
}
