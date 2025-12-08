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
}
