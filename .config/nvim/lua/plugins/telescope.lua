return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
            vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
        end,
	},
}
