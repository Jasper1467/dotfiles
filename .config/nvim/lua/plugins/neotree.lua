return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true, -- Close Neo-tree if it is the last window
                popup_border_style = "rounded",
                enable_git_status = true,
                enable_diagnostics = true,
                sort_case_insensitive = true,
                sort_function = nil, -- use default
                default_component_configs = {
                    icon = {
                        folder_closed = "",
                        folder_open = "",
                        default = "",
                    },
                    git_status = {
                        symbols = {
                            added = "✚",
                            modified = "",
                            deleted = "✖",
                            renamed = "➜",
                            untracked = "★",
                            ignored = "◌",
                            unstaged = "✗",
                            staged = "✓",
                            conflict = "",
                        },
                    },
                },
                window = {
                    position = "left",
                    width = 35,
                    mapping_options = {
                        noremap = true,
                        nowait = true,
                    },
                    mappings = {
                        ["<space>"] = "toggle_node",
                        ["<2-LeftMouse>"] = "open",
                        ["o"] = "open",
                        ["<cr>"] = "open",
                        ["S"] = "open_split",
                        ["s"] = "open_vsplit",
                        ["t"] = "open_tabnew",
                        ["w"] = "open_with_window_picker",
                        ["C"] = "close_node",
                        ["z"] = "close_all_nodes",
                        ["a"] = {
                            "add",
                            config = {
                                show_path = "relative",
                            },
                        },
                        ["A"] = "add_directory",
                        ["d"] = "delete",
                        ["r"] = "rename",
                        ["y"] = "copy_to_clipboard",
                        ["x"] = "cut_to_clipboard",
                        ["p"] = "paste_from_clipboard",
                        ["c"] = "copy",
                        ["m"] = "move",
                        ["q"] = "close_window",
                        ["R"] = "refresh",
                        ["?"] = "show_help",
                    },
                },
                filesystem = {
                    filtered_items = {
                        visible = true,
                        hide_dotfiles = false,
                        hide_gitignored = false,
                        hide_by_name = {
                            "node_modules",
                            ".cache",
                        },
                        never_show = {
                            ".DS_Store",
                            "thumbs.db",
                        },
                    },
                    follow_current_file = true,
                    group_empty_dirs = true,
                    hijack_netrw_behavior = "open_default",
                    use_libuv_file_watcher = true,
                },
                buffers = {
                    follow_current_file = true,
                    group_empty_dirs = true,
                    show_unloaded = true,
                    window = {
                        mappings = {
                            ["bd"] = "buffer_delete",
                        },
                    },
                },
                git_status = {
                    window = {
                        position = "float",
                        mappings = {
                            ["A"] = "git_add_all",
                            ["gu"] = "git_unstage_file",
                            ["ga"] = "git_add_file",
                            ["gr"] = "git_revert_file",
                            ["gc"] = "git_commit",
                            ["gp"] = "git_push",
                            ["gg"] = "git_commit_and_push",
                        },
                    },
                },
            })

            vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neo-Tree", noremap = true, silent = true })
            vim.keymap.set("n", "<leader>fe", "<cmd>Neotree focus<cr>", { desc = "Focus Neo-tree" })
            vim.keymap.set("n", "<leader>fr", "<cmd>Neotree reveal<cr>", { desc = "Reveal current file in Neo-tree" })
            vim.keymap.set("n", "<leader>fb", "<C-w>p", { desc = "Jump back to previous window" })
        end,
    },
}
