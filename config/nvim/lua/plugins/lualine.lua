return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    config = function()
        local colors = {
            bg       = "#16181a",
            bg_alt   = "#1e2124",
            fg       = "#ffffff",
            muted    = "#7b8496",
            cyan     = "#5ef1ff",
            blue     = "#5ea1ff",
            purple   = "#bd5eff",
            pink     = "#ff5ea0",
            green    = "#5effa0",
            yellow   = "#f1ff5e",
            orange   = "#ffbd5e",
            red      = "#ff6e5e",
        }

        local theme = {
            normal = {
                a = { fg = colors.bg, bg = colors.cyan, gui = "bold" },
                b = { fg = colors.fg, bg = colors.bg_alt },
                c = { fg = colors.muted, bg = colors.bg },
            },
            insert = {
                a = { fg = colors.bg, bg = colors.green, gui = "bold" },
                b = { fg = colors.fg, bg = colors.bg_alt },
                c = { fg = colors.muted, bg = colors.bg },
            },
            visual = {
                a = { fg = colors.bg, bg = colors.purple, gui = "bold" },
                b = { fg = colors.fg, bg = colors.bg_alt },
                c = { fg = colors.muted, bg = colors.bg },
            },
            replace = {
                a = { fg = colors.bg, bg = colors.red, gui = "bold" },
                b = { fg = colors.fg, bg = colors.bg_alt },
                c = { fg = colors.muted, bg = colors.bg },
            },
            command = {
                a = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
                b = { fg = colors.fg, bg = colors.bg_alt },
                c = { fg = colors.muted, bg = colors.bg },
            },
            terminal = {
                a = { fg = colors.bg, bg = colors.orange, gui = "bold" },
                b = { fg = colors.fg, bg = colors.bg_alt },
                c = { fg = colors.muted, bg = colors.bg },
            },
            inactive = {
                a = { fg = colors.muted, bg = colors.bg_alt },
                b = { fg = colors.muted, bg = colors.bg_alt },
                c = { fg = colors.muted, bg = colors.bg },
            },
        }

        require("lualine").setup({
            options = {
                theme = theme,
                globalstatus = true,
                disabled_filetypes = {
                    statusline = { "dashboard", "alpha", "NvimTree" },
                },
                component_separators = {
                    left = "│",
                    right = "│",
                },
                section_separators = {
                    left = "",
                    right = "",
                },
            },

            sections = {
                lualine_a = {
                    {
                        "mode",
                        fmt = function(str)
                            return " " .. str .. " "
                        end,
                    },
                },

                lualine_b = {
                    {
                        "branch",
                        icon = "",
                        color = { fg = colors.purple, gui = "bold" },
                    },
                    {
                        "diff",
                        symbols = {
                            added = " ",
                            modified = " ",
                            removed = " ",
                        },
                        diff_color = {
                            added = { fg = colors.green },
                            modified = { fg = colors.yellow },
                            removed = { fg = colors.red },
                        },
                    },
                },

                lualine_c = {
                    {
                        "filename",
                        file_status = true,
                        path = 1,
                        symbols = {
                            modified = " ●",
                            readonly = " ",
                            unnamed = "[No Name]",
                        },
                        color = { fg = colors.fg },
                    },
                },

                lualine_x = {
                    {
                        "diagnostics",
                        sources = { "nvim_diagnostic" },
                        symbols = {
                            error = " ",
                            warn = " ",
                            info = " ",
                            hint = "󰌵 ",
                        },
                        diagnostics_color = {
                            error = { fg = colors.red },
                            warn = { fg = colors.orange },
                            info = { fg = colors.blue },
                            hint = { fg = colors.cyan },
                        },
                    },
                    {
                        "filetype",
                        icon_only = false,
                        colored = true,
                    },
                },

                lualine_y = {
                    {
                        "encoding",
                        color = { fg = colors.muted },
                    },
                    {
                        "fileformat",
                        color = { fg = colors.muted },
                    },
                },

                lualine_z = {
                    {
                        "location",
                        color = { fg = colors.bg, bg = colors.cyan, gui = "bold" },
                    },
                    {
                        "progress",
                        color = { fg = colors.bg, bg = colors.purple, gui = "bold" },
                    },
                },
            },

            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        "filename",
                        path = 1,
                        color = { fg = colors.muted },
                    },
                },
                lualine_x = {
                    "location",
                },
                lualine_y = {},
                lualine_z = {},
            },

            extensions = {
                "neo-tree",
                "lazy",
                "mason",
                "toggleterm",
                "quickfix",
            },
        })
    end,
}
