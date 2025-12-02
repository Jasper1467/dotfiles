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

			-- Setup mason
			require("mason").setup()
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")

			mason_lspconfig.setup({
				ensure_installed = { "clangd", "lua_ls", "gopls", "rust_analyzer", "zls", "bashls" },
			})

			-- Shared on_attach callback
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

			-- Capabilities (for nvim-cmp completion)
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- C++ (clangd)
			vim.lsp.config["clangd"] = {
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--completion-style=bundled",
					"--header-insertion=iwyu",
					"--log=error",
					"--offset-encoding=utf-16",
					"--cross-file-rename",
				},
				on_attach = on_attach,
				capabilities = capabilities,
			}

			-- Lua
			vim.lsp.config["lua_ls"] = {
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
			}

			-- Go
			vim.lsp.config["gopls"] = {
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					gopls = {
						completeUnimported = true,
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
					},
				},
			}

			-- Rust
			vim.lsp.config["rust_analyzer"] = {
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
						cargo = {
							loadOutDirsFromCheck = true,
						},
					},
				},
			}

			-- Zig
			vim.lsp.config["zls"] = {
				on_attach = on_attach,
				capabilities = capabilities,
			}

            -- Shell
			vim.lsp.config["bashls"] = {
				on_attach = on_attach, -- reuse your existing on_attach callback
				capabilities = capabilities, -- reuse cmp capabilities
				settings = {
					bashIde = {
						globPattern = "*@(.sh|.inc|.bash)", -- files to lint
					},
				},
			}

			-- Auto-setup servers from mason-lspconfig
			mason_lspconfig.setup_handlers({
				function(server_name) -- default handler
					local lspconfig = require("lspconfig")
					local config = vim.lsp.config[server_name] or {}
					lspconfig[server_name].setup(config)
				end,
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
