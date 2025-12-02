return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- Define cyberpunk color palette
			local cyber_colors = {
				blue = "#00ffff",
				purple = "#ff00ff",
				pink = "#ff007f",
				green = "#00ff00",
				orange = "#ff8c00",
				bg = "#1a1a2e",
				fg = "#c0c0c0",
				red = "#ff0000",
				yellow = "#ffff00",
				black = "#000000", -- added black
			}

			-- Define a custom theme
			local cyber_theme = {
				normal = {
					a = { fg = cyber_colors.bg, bg = cyber_colors.pink, gui = "bold" },
					b = { fg = cyber_colors.fg, bg = cyber_colors.blue },
					c = { fg = cyber_colors.fg, bg = cyber_colors.bg },
				},
				insert = {
					a = { fg = cyber_colors.bg, bg = cyber_colors.green, gui = "bold" },
					b = { fg = cyber_colors.fg, bg = cyber_colors.blue },
					c = { fg = cyber_colors.fg, bg = cyber_colors.bg },
				},
				visual = {
					a = { fg = cyber_colors.bg, bg = cyber_colors.purple, gui = "bold" },
					b = { fg = cyber_colors.fg, bg = cyber_colors.blue },
					c = { fg = cyber_colors.fg, bg = cyber_colors.bg },
				},
				replace = {
					a = { fg = cyber_colors.bg, bg = cyber_colors.red, gui = "bold" },
					b = { fg = cyber_colors.fg, bg = cyber_colors.blue },
					c = { fg = cyber_colors.fg, bg = cyber_colors.bg },
				},
				command = {
					a = { fg = cyber_colors.bg, bg = cyber_colors.orange, gui = "bold" },
					b = { fg = cyber_colors.fg, bg = cyber_colors.blue },
					c = { fg = cyber_colors.fg, bg = cyber_colors.bg },
				},
				inactive = {
					a = { fg = cyber_colors.fg, bg = cyber_colors.bg, gui = "bold" },
					b = { fg = cyber_colors.fg, bg = cyber_colors.bg },
					c = { fg = cyber_colors.fg, bg = cyber_colors.bg },
				},
			}

			require("lualine").setup({
				options = {
					theme = cyber_theme,
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
					globalstatus = true,
					disabled_filetypes = { "lazy", "NvimTree", "packer" },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					-- Set progress text color to black
					lualine_y = {
						{ "progress", color = { fg = cyber_colors.black, bg = cyber_colors.blue, gui = "bold" } },
					},
					lualine_z = { "location" },
				},
				extensions = { "quickfix", "nvim-tree", "toggleterm" },
			})
		end,
	},
}
