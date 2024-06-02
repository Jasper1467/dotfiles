-- C++
vim.g.neoformat_enabled_cpp = { "clangformat" }
vim.g.neoformat_cpp_clangformat = {
  exe = "clang-format",
  args = {},
  stdin = true,
}

-- Assembly
vim.g.neoformat_enabled_asm = { "asmfmt" }
vim.g.neoformat_cpp_asmfmt = {
  exe = vim.fn.expand("~/.local/share/nvim/mason/bin/asmfmt"),
  stdin = true,
}
