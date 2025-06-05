return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({})
        vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc="Toggle Terminal", noremap = true, silent = true })
	end,
}
