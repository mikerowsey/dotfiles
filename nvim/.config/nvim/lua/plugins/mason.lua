return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup({
                -- Prefer Mason-managed binaries over global npm/brew installs.
                PATH = "prepend",
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                -- lspconfig server names
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "pyright",
                    "rust_analyzer",
                    "bashls",
                    "jsonls",
                    "yamlls",
                    "taplo",
                    "marksman",
                    "ts_ls",
                    "html",
                    "cssls",
                },
                -- Disabled: lsp.lua handles vim.lsp.enable() explicitly
                -- so our capabilities + settings are applied first
                automatic_enable = false,
            })
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    "stylua",
                    "clang-format",
                    "prettier",
                    "black",
                    "isort",
                    "ruff",
                    "eslint_d",
                    "shfmt",
                    "shellcheck",
                    "markdownlint",
                    "yamllint",
                },
                auto_update = false,
                run_on_start = true,
                start_delay = 3000,
                debounce_hours = 12,
            })
        end,
    },
}
