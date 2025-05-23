vim.g.mapleader = " "

local map = vim.keymap.set

map("n", "<leader>e", ":Ex<CR>", { desc = "Open file explorer" })
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })

map("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

map("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
