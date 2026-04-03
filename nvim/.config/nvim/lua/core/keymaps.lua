local map = vim.keymap.set

-- Keymap convention:
-- Keep global/editor and cross-plugin mappings in this file.
-- Keep plugin-local behavior mappings in each plugin's setup (e.g. cmp insert mappings).

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

map("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Next diagnostic" })
map("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Prev diagnostic" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Line diagnostics" })
map("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })
map("n", "<leader>dv", function()
	local current = vim.diagnostic.config().virtual_text
	local enabled = current == false
	vim.diagnostic.config({ virtual_text = enabled })
	vim.notify("Diagnostic virtual text " .. (enabled and "enabled" or "disabled"))
end, { desc = "Toggle diagnostic virtual text" })
map("n", "<leader>dn", function()
	require("lint").try_lint()
end, { desc = "Run linters now" })
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble diagnostics" })
map("n", "<leader>xw", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Trouble buffer diagnostics" })
map("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Trouble quickfix" })
map("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Trouble loclist" })

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
map("n", "<leader>td", vim.lsp.buf.type_definition, { desc = "Type definition" })
map("n", "<leader>si", vim.lsp.buf.signature_help, { desc = "Signature help" })
map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Workspace add folder" })
map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Workspace remove folder" })
map("n", "<leader>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "Workspace list folders" })
map("n", "<leader>uh", function()
	local ok_is_enabled, is_enabled = pcall(vim.lsp.inlay_hint.is_enabled, { bufnr = 0 })
	if not ok_is_enabled then
		vim.notify("Inlay hints are not supported in this Neovim version", vim.log.levels.WARN)
		return
	end
	vim.lsp.inlay_hint.enable(not is_enabled, { bufnr = 0 })
end, { desc = "Toggle inlay hints" })

-- ======================
-- Sessions
-- ======================

map("n", "<leader>Ss", "<cmd>SessionSave<cr>", { desc = "Session save" })
map("n", "<leader>Sr", "<cmd>SessionRestore<cr>", { desc = "Session restore" })
map("n", "<leader>Sf", "<cmd>SessionSearch<cr>", { desc = "Session search" })

-- ======================
-- Formatting
-- ======================

map("n", "<leader>cf", function()
	require("conform").format({ timeout_ms = 3000, lsp_format = "fallback" })
end, { desc = "Format buffer" })
map("n", "<leader>ci", "<cmd>ConformInfo<cr>", { desc = "Conform info" })

-- ======================
-- Telescope
-- ======================

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fa", "<cmd>Telescope find_files hidden=true<cr>", { desc = "Find all files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
map("n", "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Search in buffer" })
map("n", "<leader>dw", "<cmd>Telescope diagnostics<cr>", { desc = "Workspace diagnostics" })

-- Quickfix / Loclist navigation
map("n", "]q", "<cmd>cnext<cr>", { desc = "Quickfix next" })
map("n", "[q", "<cmd>cprev<cr>", { desc = "Quickfix prev" })
map("n", "]l", "<cmd>lnext<cr>", { desc = "Loclist next" })
map("n", "[l", "<cmd>lprev<cr>", { desc = "Loclist prev" })

-- ======================
-- Gitsigns
-- ======================

-- GitSigns
map("n", "]h", function()
	require("gitsigns").next_hunk()
end, { desc = "Next hunk" })
map("n", "[h", function()
	require("gitsigns").prev_hunk()
end, { desc = "Prev hunk" })
map("n", "<leader>gp", function()
	require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })
map("n", "<leader>gs", function()
	require("gitsigns").stage_hunk()
end, { desc = "Stage hunk" })
map("n", "<leader>gu", function()
	require("gitsigns").undo_stage_hunk()
end, { desc = "Unstage hunk" })
map("n", "<leader>gr", function()
	require("gitsigns").reset_hunk()
end, { desc = "Reset hunk" })
map("n", "<leader>gb", function()
	require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle blame" })
map("n", "<leader>gB", function()
	require("gitsigns").blame_line({ full = true })
end, { desc = "Blame line" })
map("n", "<leader>gd", function()
	require("gitsigns").diffthis()
end, { desc = "Diff this" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })
map("n", "<leader>gC", "<cmd>Telescope git_bcommits<cr>", { desc = "Buffer commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<cr>", { desc = "Git status" })
