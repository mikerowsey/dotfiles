local map = vim.keymap.set

-- General
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear Search Highlight" })

-- Window Navigation

map("n", "<leader>ws", "<cmd>split<CR>", { desc = "Horizontal Split" })
map("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Vertical Split" })

map("n", "<leader>wh", "<C-w>h", { desc = "Window Left" })
map("n", "<leader>wj", "<C-w>j", { desc = "Window Down" })
map("n", "<leader>wk", "<C-w>k", { desc = "Window Up" })
map("n", "<leader>wl", "<C-w>l", { desc = "Window Right" })


