return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                c = { "clang_format" },
                cpp = { "clang_format" },
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
