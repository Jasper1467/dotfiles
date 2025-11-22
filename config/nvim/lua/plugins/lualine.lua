return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, for file icons
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",       -- matches your catppuccin colorscheme
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
          globalstatus = true,        -- use global statusline (neovim 0.7+)
          disabled_filetypes = { "lazy", "NvimTree", "packer" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        extensions = { "quickfix", "nvim-tree", "toggleterm" },
      })
    end,
  },
}
