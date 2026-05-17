vim.g.mapleader = " "

-- Duplicate line when in insert mode
vim.keymap.set("i", "<C-d>", function()
	local row = vim.api.nvim_win_get_cursor(0)[1]
	vim.cmd("normal! yy") -- yank current line
	vim.cmd("normal! p") -- paste below
	vim.api.nvim_win_set_cursor(0, { row, 0 }) -- restore cursor position
end, { noremap = true, silent = true })

-- Switch current line with the line above/below
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })

-- Delete the next "word" or symbol chunk like VSCode
vim.keymap.set("i", "<C-Del>", function()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local line = vim.api.nvim_get_current_line()

	-- Nothing to delete if at end of line
	if col >= #line then
		return
	end

	-- Find next word boundary using Lua pattern
	local after_cursor = line:sub(col + 1)
	local s, e = after_cursor:find("%s") -- first whitespace after cursor

	-- If no whitespace found, delete until end of line
	local delete_until = e or #after_cursor

	-- Construct new line
	local new_line = line:sub(1, col) .. after_cursor:sub(delete_until + 1)
	vim.api.nvim_set_current_line(new_line)

	-- Keep cursor at same position
	vim.api.nvim_win_set_cursor(0, { row, col })
end, { noremap = true, silent = true })

vim.keymap.set("i", "<C-BS>", "<Esc>dbi", { noremap = true })

vim.keymap.set("n", "<F12>", vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set("n", "<S-F12>", vim.lsp.buf.references, { noremap = true, silent = true })
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { noremap = true, silent = true })
vim.keymap.set("n", "<C-f>", "/", { noremap = true })
vim.keymap.set("n", "<C-S-F>", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-\\>", ":vsplit<CR>", { noremap = true })
vim.keymap.set("n", "<C-S-\\>", ":split<CR>", { noremap = true })
vim.keymap.set("n", "<C-Tab>", ":tabnext<CR>", { noremap = true })
vim.keymap.set("n", "<C-S-Tab>", ":tabprevious<CR>", { noremap = true })
