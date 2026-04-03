return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")

      wk.setup({
        plugins = {
          presets = {
            operators = false,
            motions = false,
            text_objects = false,
            windows = false,
            nav = false,
          },
        },
        icons = {
          separator = "➜",
          group = "+",
        },
      })

      wk.add({
        { "<leader>S", group = "Session" },
        { "<leader>c", group = "Code" },
        { "<leader>d", group = "Diagnostics" },
        { "<leader>f", group = "Find" },
        { "<leader>g", group = "Git" },
        { "<leader>u", group = "UI/Toggles" },
        { "<leader>w", group = "Workspace" },
        { "<leader>x", group = "Trouble" },
      })
    end,
  },
}