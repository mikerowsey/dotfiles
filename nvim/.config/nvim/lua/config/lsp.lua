vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
})

vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
        "--header-insertion=iwyu",
    },
    filetypes = {
        "c",
        "cpp",
        "objc",
        "objcpp",
    },
    root_markers = {
        "compile_commands.json",
        "compile_flags.txt",
        ".clangd",
        ".git",
    },
})

vim.lsp.config("rust_analyzer", {
    settings = {
        ["rust-analyzer"] = {
            check = {
                command = "clippy",
            },
        },
    },
})

vim.lsp.config("gopls", {
    settings = {
        gopls = {
            staticcheck = true,
        },
    },
})

vim.lsp.config("ts_ls", {
    root_markers = {
        "tsconfig.json",
        "jsconfig.json",
        "package.json",
        ".git",
    },
})

vim.lsp.config("html", {
    filetypes = {
        "html",
        "templ",
    },
})

vim.lsp.config("cssls", {
    filetypes = {
        "css",
        "scss",
        "less",
    },
})

vim.lsp.enable({
    "lua_ls",
    "basedpyright",
    "clangd",
    "rust_analyzer",
    "gopls",
    "ts_ls",
    "html",
    "cssls",
})