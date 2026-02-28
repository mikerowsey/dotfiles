local map = vim.keymap.set

-- ======================
-- Core
-- ======================

map("n", "<leader>w", "<cmd>write<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit" })

-- Better window movement
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- ======================
-- Diagnostics
-- ======================

map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Line diagnostics" })
map("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })

-- ======================
-- LSP (Telescope-powered)
-- ======================

map("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Definitions" })
map("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "References" })
map("n", "gi", "<cmd>Telescope lsp_implementations<cr>", { desc = "Implementations" })
map("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Document symbols" })
map("n", "<leader>ws", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "Workspace symbols" })

map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })

-- ======================
-- Formatting
-- ======================

map("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer" })

-- ======================
-- Telescope
-- ======================

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fa", "<cmd>Telescope find_files hidden=true<cr>", { desc = "Find all files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
