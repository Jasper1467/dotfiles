return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                c = { "clang_format" },
                cpp = { "clang_format" },
                ts = { "prettier" },
                tsx = { "prettier" },
                js = { "prettier" },
                jsx = { "prettier" },
                json = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                go = { "gofmt" },
                lua = { "stylua" },
            },
        },
        keys = {
            {
                "<leader>=",
                function() require("conform").format() end,
                mode = "n",
                desc = "Format file",
            },
        },
    }
}

