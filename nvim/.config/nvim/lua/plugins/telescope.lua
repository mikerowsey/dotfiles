return {
    "nvim-telescope/telescope.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    opts = {
        defaults = {
            sorting_strategy = "ascending",

            layout_config = {
                prompt_position = "top",
            },
        },
    },

    keys = {
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files()
            end,
            desc = "Find Files",
        },

        {
            "<leader>fF",
            function()
                require("telescope.builtin").find_files({
                hidden = true,
                no_ignore = true,
            })
            end,
            desc = "Find Files (All)",
        },

        {
            "<leader>fg",
            function()
                require("telescope.builtin").live_grep()
            end,
            desc = "Find Text",
        },

        {
            "<leader>fb",
            function()
                require("telescope.builtin").buffers()
            end,
            desc = "Buffers",
        },

        {
            "<leader>fh",
            function()
                require("telescope.builtin").help_tags()
            end,
            desc = "Help",
        },

        {
            "<leader>/",
            function()
                require("telescope.builtin").current_buffer_fuzzy_find()
            end,
            desc = "Search Buffer",
        },
    },
}
