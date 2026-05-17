return {
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
