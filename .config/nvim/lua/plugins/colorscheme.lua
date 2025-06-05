return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000, -- load early to avoid colorscheme flash
		config = function()
			require("catppuccin").setup({
				flavour = "frappe",
				transparent_background = false,
				term_colors = true,
				integrations = {
					treesitter = true,
					lsp_trouble = true,
					cmp = true,
					gitsigns = true,
					telescope = true,
					notify = true,
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
