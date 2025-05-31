vim.g.mapleader = " "

local map = vim.keymap.set

map("n", "<leader>e", ":Ex<CR>", { desc = "Open file explorer" })
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })

map("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

map("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })


-- Duplicate line when in insert mode
map('i', '<C-d>', function()
  local row = vim.api.nvim_win_get_cursor(0)[1]
  vim.cmd('normal! yy')        -- yank current line
  vim.cmd('normal! p')         -- paste below
  vim.api.nvim_win_set_cursor(0, {row, 0}) -- restore cursor position
end, { noremap = true, silent = true })

map("n", "<A-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
map("n", "<A-Down>", ":m .+1<CR>==", { noremap = true, silent = true })

map("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
map("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })

map("v", "<A-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

