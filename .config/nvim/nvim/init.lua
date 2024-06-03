-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Set tab width to 4 spaces
vim.opt.tabstop = 4 -- Number of spaces a <Tab> in the file counts for
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- Convert tabs to spaces

-- Duplicate line downwards and move cursor to the duplicated line
vim.api.nvim_set_keymap("n", "<C-d>", ':<C-u>execute "normal! yypj"<CR>', { noremap = true })
vim.api.nvim_set_keymap("i", "<C-d>", '<Esc>:<C-u>execute "normal! yypj"<CR>gi', { noremap = true })
vim.api.nvim_set_keymap(
  "v",
  "<C-d>",
  ':<C-u>execute "normal! y"<CR>:<C-u>execute "normal! yypj"<CR>',
  { noremap = true }
)

-- Prevent default behavior of Ctrl + D to scroll half a screen down
vim.api.nvim_set_keymap("n", "<C-d>", "<Nop>", { noremap = true })

vim.g.loaded_node_provider = false
vim.g.loaded_perl_provider = false
vim.g.loaded_python3_provider = false

require("lazy").setup("plugins")

require("config.neoformat")

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "asm-lsp" },
})

require("lspconfig").asm_lsp.setup({
  cmd = { "asm-lsp" },
  filetypes = { "asm", "s" },
  root_dir = function(fname)
    return vim.loop.cwd()
  end,
  single_file_support = true,
})
