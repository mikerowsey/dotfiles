local function has_executable(bin)
    return vim.fn.executable(bin) == 1
end

vim.api.nvim_create_user_command("DevStatus", function()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    local client_names = {}

    for _, client in ipairs(clients) do
        table.insert(client_names, client.name)
    end

    local treesitter_ok = pcall(vim.treesitter.get_parser, 0)

    local lines = {
        "Dev Status",
        "- Mason: " .. tostring(pcall(require, "mason")),
        "- Treesitter parser (current buffer): " .. (treesitter_ok and "ok" or "missing"),
        "- Active LSP clients: " .. (#client_names > 0 and table.concat(client_names, ", ") or "none"),
        "- rust-analyzer in PATH: " .. (has_executable("rust-analyzer") and "yes" or "no"),
        "- tsserver in PATH: " .. (has_executable("typescript-language-server") and "yes" or "no"),
    }

    vim.notify(table.concat(lines, "\n"), vim.log.levels.INFO, { title = "Neovim" })
end, { desc = "Show Mason/LSP/Treesitter status" })

vim.api.nvim_create_user_command("DevHealth", function()
    vim.cmd("checkhealth mason")
end, { desc = "Run health checks (start with mason)" })

vim.api.nvim_create_user_command("DevUpdate", function()
    vim.cmd("Lazy sync")
    vim.cmd("MasonUpdate")
    vim.cmd("TSUpdate")
end, { desc = "Update Lazy plugins, Mason registry, and Treesitter parsers" })
