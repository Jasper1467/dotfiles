return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",           -- LSP/DAP/Linter installer
            "williamboman/mason-lspconfig.nvim", -- Bridge for mason + lspconfig
            "folke/neodev.nvim",                 -- Better Lua support for Neovim config
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            require("neodev").setup()

            -- Setup mason and ensure clangd and lua_ls are installed
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "clangd", "lua_ls" },
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
                    "--cross-file-rename",
                },
                on_attach = on_attach,
                capabilities = capabilities,
            }

            -- Lua (lua_ls)
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

            -- Auto-setup servers from mason-lspconfig
            local lspconfig = require("lspconfig")

            require("mason-lspconfig").setup({
                ensure_installed = { "clangd", "lua_ls" },
                handlers = {
                    function(server_name)
                        local config = vim.lsp.config[server_name]
                        if config then
                            lspconfig[server_name].setup(config)
                        else
                            lspconfig[server_name].setup({})
                        end
                    end,
                },
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
