return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({})
      local map = vim.keymap.set
      map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
      map("n", "<leader>fa", "<cmd>Telescope find_files hidden=true<cr>", { desc = "Find all files (incl. dotfiles)" })
      map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Grep" })
      map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
    end,
  },
}

