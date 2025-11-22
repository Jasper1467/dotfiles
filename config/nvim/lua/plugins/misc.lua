return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({})
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "cpp", "c", "lua", "vim" },
                highlight = { enabled = true }
            })
        end,
    },
    { "tpope/vim-fugitive" },
    { "ojroques/nvim-osc52" },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        "Civitasv/cmake-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("cmake-tools").setup({
                cmake_command = "cmake",
                cmake_build_directory = "build",
                cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
            })
        end,
    },
    {
        "mfussenegger/nvim-dap",
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = { "mason.nvim", "nvim-dap" },
        config = function()
            require("mason-nvim-dap").setup({
                ensure_installed = { "codelldb" },
                automatic_installation = true,
            })
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            require("dapui").setup()
            local dap = require("dap")
            dap.listeners.after.event_initialized["dapui_config"] = function()
                require("dapui").open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                require("dapui").close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                require("dapui").close()
            end
        end,
    }, 
}
