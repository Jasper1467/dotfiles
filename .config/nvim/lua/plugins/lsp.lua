return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim", -- LSP/DAP/Linter installer
			"williamboman/mason-lspconfig.nvim", -- Bridge for mason + lspconfig
			"folke/neodev.nvim", -- Better Lua support for Neovim config
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("neodev").setup()

			local lspconfig = require("lspconfig")

			-- Setup mason and ensure clangd is installed
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "clangd", "lua_ls" },
			})

			-- General on_attach (shared across servers)
			local on_attach = function(_, bufnr)
				local map = function(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end

				map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
				map("n", "gr", vim.lsp.buf.references, "Go to References")
				map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
				map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
				map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
				map("n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
				map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
			end

			-- C++ (clangd) specific setup
			lspconfig.clangd.setup({
				on_attach = on_attach,
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--completion-style=bundled",
					"--header-insertion=iwyu",
					"--cross-file-rename",
				},
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			-- Lua
			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				settings = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})
		end,
	},

	{
		"p00f/clangd_extensions.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("clangd_extensions").setup({
				inlay_hints = { enabled = true },
			})
		end,
	},
}
