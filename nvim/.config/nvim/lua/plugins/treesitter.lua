return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,    -- must not be lazy-loaded
        build = ":TSUpdate", -- updates parsers when plugin updates
        config = function()
            require("nvim-treesitter").setup({
                install_dir = vim.fn.stdpath("data") .. "/site",
            })

            -- Automatically start Treesitter for supported filetypes
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })
        end,
    },
}
