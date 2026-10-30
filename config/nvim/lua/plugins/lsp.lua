return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",

			-- Replace neodev.nvim
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {},
			},
		},

		config = function()
			require("mason").setup()

			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
					"lua_ls",
					"gopls",
					"rust_analyzer",
					"zls",
					"bashls",
					"pyright",
				},
			})

			local util = require("lspconfig.util")

			local capabilities =
				require("cmp_nvim_lsp").default_capabilities()

			local on_attach = function(_, bufnr)
				local map = function(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, {
						buffer = bufnr,
						desc = desc,
					})
				end

				map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
				map("n", "gr", vim.lsp.buf.references, "Go to References")
				map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
				map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
				map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
				map("n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
				map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
			end

			local servers = {
				clangd = {
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
				},

				lua_ls = {
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							telemetry = {
								enable = false,
							},
						},
					},
				},

				gopls = {
					settings = {
						gopls = {
							completeUnimported = true,
							analyses = {
								unusedparams = true,
							},
							staticcheck = true,
						},
					},
				},

				rust_analyzer = {
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
				},

				zls = {
					root_dir = util.root_pattern(
						"zls.json",
						"build.zig",
						".git"
					),
				},

				bashls = {
					settings = {
						bashIde = {
							globPattern = "*@(.sh|.inc|.bash)",
						},
					},
				},

				pyright = {
					settings = {
						python = {
							analysis = {
								typeCheckingMode = "basic",
								autoSearchPaths = true,
								useLibraryCodeForTypes = true,
							},
						},
					},
				},
			}

			for server, config in pairs(servers) do
				config.capabilities = capabilities
				config.on_attach = on_attach

				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end
		end,
	},

	{
		"p00f/clangd_extensions.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("clangd_extensions").setup({
				inlay_hints = {
					enabled = true,
				},
			})
		end,
	},
}
