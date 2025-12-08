return {
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
}
