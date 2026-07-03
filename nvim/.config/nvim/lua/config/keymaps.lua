local map = vim.keymap.set

-- General
map("n", "<leader>s", "<cmd>w<CR>", { desc = "Write Buffer" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit Window" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear Search Highlight" })

-- Window Navigation

map("n", "<leader>ws", "<cmd>split<CR>", { desc = "Horizontal Split" })
map("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Vertical Split" })

map("n", "<leader>wh", "<C-w>h", { desc = "Window Left" })
map("n", "<leader>wj", "<C-w>j", { desc = "Window Down" })
map("n", "<leader>wk", "<C-w>k", { desc = "Window Up" })
map("n", "<leader>wl", "<C-w>l", { desc = "Window Right" })

-- LSP
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "gr", vim.lsp.buf.references, { desc = "Find References" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename Symbol" })
