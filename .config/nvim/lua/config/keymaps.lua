-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here-

vim.api.nvim_set_keymap("i", "<C-e>", "<C-o>$", { noremap = true }) -- Move to end of line in insert mode

-- Neotree toggle with Ctrl+b
vim.api.nvim_set_keymap("i", "<C-b>", "<Esc>:Neotree<CR>", { noremap = true })

-- Duplicate line below (Shift+Alt+Down)
vim.api.nvim_set_keymap("i", "<S-A-Down>", "<Esc>:t.<CR>", { noremap = true, silent = true })

-- Duplicate line above (Shift+Alt+Up)
vim.api.nvim_set_keymap("i", "<S-A-Up>", "<Esc>:t-2<CR>", { noremap = true, silent = true })

-- Alt + Up to move current line up in insert mode
vim.api.nvim_set_keymap("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })

-- Alt + Down to move current line down in insert mode
vim.api.nvim_set_keymap("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
