return {
    "folke/trouble.nvim",

    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    opts = {},

    keys = {
        {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle<CR>",
            desc = "Diagnostics",
        },

        {
            "<leader>xX",
            "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
            desc = "Buffer Diagnostics",
        },

        {
            "<leader>xq",
            "<cmd>Trouble qflist toggle<CR>",
            desc = "Quickfix List",
        },

        {
            "<leader>xl",
            "<cmd>Trouble loclist toggle<CR>",
            desc = "Location List",
        },

        {
            "<leader>xr",
            "<cmd>Trouble lsp_references toggle<CR>",
            desc = "References",
        },

        {
            "<leader>xs",
            "<cmd>Trouble symbols toggle focus=false<CR>",
            desc = "Symbols",
        },
    },
}
