-- Requires debugpy: uv tool install debugpy
return {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
        "mfussenegger/nvim-dap",
    },
    config = function()
        -- Uses the first python3 on PATH; debugpy must be importable from it.
        -- If using a venv, activate it before opening Neovim, or point to the venv python.
        require("dap-python").setup("python3")
    end,
}
