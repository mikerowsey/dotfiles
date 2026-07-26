return {
    "MagicDuck/grug-far.nvim",
    opts = {},
    keys = {
        {
            "<leader>rr",
            function()
                require("grug-far").open()
            end,
            desc = "Search & Replace",
        },
        {
            "<leader>rw",
            function()
                require("grug-far").open({
                    prefills = { search = vim.fn.expand("<cword>") },
                })
            end,
            desc = "Replace Word",
        },
    },
}
