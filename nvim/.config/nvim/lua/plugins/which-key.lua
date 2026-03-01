return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({
        plugins = {
          presets = {
            operators = false,
            motions = false,
            text_objects = false,
            windows = false,
            nav = false,
          },
        },
        replace = {
          ["<leader>"] = "SPC",
        },
        icons = {
          breadcrumb = "»",
          separator = "➜",
          group = "+",
        },
      })
    end,
  },
}