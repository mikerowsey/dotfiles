return {
    "lewis6991/gitsigns.nvim",

    opts = {
        signs = {
            add          = { text = "+" },
            change       = { text = "~" },
            delete       = { text = "_" },
            topdelete    = { text = "‾" },
            changedelete = { text = "~" },
        },
    },

    keys = {
        {
            "]h",
            function()
                require("gitsigns").next_hunk()
            end,
            desc = "Next Hunk",
        },

        {
            "[h",
            function()
                require("gitsigns").prev_hunk()
            end,
            desc = "Previous Hunk",
        },

        {
            "<leader>gp",
            function()
                require("gitsigns").preview_hunk()
            end,
            desc = "Preview Hunk",
        },

        {
            "<leader>gr",
            function()
                require("gitsigns").reset_hunk()
            end,
            desc = "Reset Hunk",
        },

        {
            "<leader>gs",
            function()
                require("gitsigns").stage_hunk()
            end,
            desc = "Stage Hunk",
        },

        {
            "<leader>gb",
            function()
                require("gitsigns").blame_line()
            end,
            desc = "Blame Line",
        },
    },
}
