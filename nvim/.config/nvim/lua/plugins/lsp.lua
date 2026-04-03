return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local function project_root(bufnr, markers)
                return vim.fs.root(bufnr, markers) or vim.fs.root(bufnr, { ".git" })
            end

            -- Lua
            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                root_dir = function(bufnr)
                    return project_root(bufnr, {
                        ".luarc.json",
                        ".luarc.jsonc",
                        "stylua.toml",
                        "selene.toml",
                        ".git",
                    })
                end,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            checkThirdParty = false,
                        },
                    },
                },
            })

            -- C / C++
            vim.lsp.config("clangd", {
                capabilities = capabilities,
                root_dir = function(bufnr)
                    return project_root(bufnr, {
                        "compile_commands.json",
                        "compile_flags.txt",
                        ".clangd",
                    })
                end,
            })

            -- Python
            vim.lsp.config("pyright", {
                capabilities = capabilities,
                root_dir = function(bufnr)
                    return project_root(bufnr, {
                        "pyproject.toml",
                        "setup.py",
                        "setup.cfg",
                        "requirements.txt",
                        "Pipfile",
                        "pyrightconfig.json",
                    })
                end,
            })

            -- Rust
            vim.lsp.config("rust_analyzer", {
                capabilities = capabilities,
                root_dir = function(bufnr)
                    return project_root(bufnr, {
                        "Cargo.toml",
                        "rust-project.json",
                    })
                end,
                settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            allFeatures = true,
                        },
                        checkOnSave = true,
                        inlayHints = {
                            bindingModeHints = { enable = false },
                            closingBraceHints = { enable = true, minLines = 25 },
                            closureReturnTypeHints = { enable = "with_block" },
                            lifetimeElisionHints = { enable = "skip_trivial" },
                            parameterHints = { enable = true },
                            typeHints = { enable = true },
                        },
                    },
                },
            })

            -- Bash
            vim.lsp.config("bashls", {
                capabilities = capabilities,
                root_dir = function(bufnr)
                    return project_root(bufnr, {
                        ".bashrc",
                        ".bash_profile",
                        ".shellcheckrc",
                    })
                end,
            })

            -- JSON
            vim.lsp.config("jsonls", {
                capabilities = capabilities,
                root_dir = function(bufnr)
                    return project_root(bufnr, { "package.json", "tsconfig.json", "composer.json" })
                end,
            })

            -- YAML
            vim.lsp.config("yamlls", {
                capabilities = capabilities,
                root_dir = function(bufnr)
                    return project_root(bufnr, {
                        "docker-compose.yml",
                        "docker-compose.yaml",
                        "kustomization.yaml",
                        "Chart.yaml",
                    })
                end,
            })

            -- TOML
            vim.lsp.config("taplo", {
                capabilities = capabilities,
                root_dir = function(bufnr)
                    return project_root(bufnr, { "Cargo.toml", "pyproject.toml", "taplo.toml" })
                end,
            })

            -- Markdown
            vim.lsp.config("marksman", {
                capabilities = capabilities,
                root_dir = function(bufnr)
                    return project_root(bufnr, { ".marksman.toml", "mkdocs.yml" })
                end,
            })

            -- TypeScript / JavaScript
            vim.lsp.config("ts_ls", {
                capabilities = capabilities,
                root_dir = function(bufnr)
                    return project_root(bufnr, {
                        "package.json",
                        "tsconfig.json",
                        "jsconfig.json",
                        "deno.json",
                    })
                end,
                on_attach = function(client)
                    -- Use Conform+Prettier as the single formatter for JS/TS files.
                    client.server_capabilities.documentFormattingProvider = false
                    client.server_capabilities.documentRangeFormattingProvider = false
                end,
            })

            -- HTML
            vim.lsp.config("html", {
                capabilities = capabilities,
                root_dir = function(bufnr)
                    return project_root(bufnr, {
                        "package.json",
                        "index.html",
                    })
                end,
            })

            -- CSS / SCSS / Less
            vim.lsp.config("cssls", {
                capabilities = capabilities,
                root_dir = function(bufnr)
                    return project_root(bufnr, {
                        "package.json",
                        "postcss.config.js",
                        "tailwind.config.js",
                    })
                end,
            })

            vim.lsp.enable({
                "lua_ls", "clangd", "pyright", "rust_analyzer",
                "bashls", "jsonls", "yamlls", "taplo", "marksman",
                "ts_ls", "html", "cssls",
            })
        end,
    },
}
