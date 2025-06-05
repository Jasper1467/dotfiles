return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
            require("nvim-autopairs").setup({})
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "cpp", "c", "lua", "vim" },
                highlight = { enabled = true }
			})
		end,
	},
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end,
    },
    {
        "kevinhwang91/nvim-bqf",
        event = "VeryLazy",
        opts = {},
    },
    {
        "ggandor/leap.nvim",
        init = function()
            require("leap").add_default_mappings()
        end,
        dependencies = {
            "tpope/vim-repeat",
        },
        lazy = false,
    }
}
