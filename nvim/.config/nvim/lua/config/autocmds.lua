local group = vim.api.nvim_create_augroup("user", {})

vim.api.nvim_create_autocmd("LspAttach", {
    group = group,
    callback = function(event)
        local map = vim.keymap.set
        local buf = event.buf
        map("n", "gd", vim.lsp.buf.definition, { buffer = buf, desc = "Go to Definition" })
        map("n", "gr", vim.lsp.buf.references, { buffer = buf, desc = "Find References" })
        map("n", "K", vim.lsp.buf.hover, { buffer = buf, desc = "Hover Documentation" })
        map("n", "<leader>cr", vim.lsp.buf.rename, { buffer = buf, desc = "Rename Symbol" })
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = group,
    callback = function()
        vim.highlight.on_yank()
    end,
})
