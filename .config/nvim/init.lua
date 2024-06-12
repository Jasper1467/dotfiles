-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Set tab width to 4 spaces
vim.opt.tabstop = 4 -- Number of spaces a <Tab> in the file counts for
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- Convert tabs to spaces

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

vim.cmd.colorscheme("catppuccin-macchiato")

require("config.lualine")
require("config.options")
require("config.keymaps")
require("config.autocmds")
