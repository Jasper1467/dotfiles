vim.g.mapleader = " "

-- Duplicate line when in insert mode
vim.keymap.set('i', '<C-d>', function()
  local row = vim.api.nvim_win_get_cursor(0)[1]
  vim.cmd('normal! yy')        -- yank current line
  vim.cmd('normal! p')         -- paste below
  vim.api.nvim_win_set_cursor(0, {row, 0}) -- restore cursor position
end, { noremap = true, silent = true })

-- Switch current line with the line above/below
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
