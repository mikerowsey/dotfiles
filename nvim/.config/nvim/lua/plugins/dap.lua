return {
    "mfussenegger/nvim-dap",

    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "theHamsta/nvim-dap-virtual-text",
    },

    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup()
        require("nvim-dap-virtual-text").setup()

        -- Auto open/close UI with debug session
        dap.listeners.after.event_initialized["dapui_config"] = dapui.open
        dap.listeners.before.event_terminated["dapui_config"] = dapui.close
        dap.listeners.before.event_exited["dapui_config"] = dapui.close

        -- Rust / C / C++ via lldb-dap (from LLVM homebrew)
        dap.adapters.lldb = {
            type = "executable",
            command = "/opt/homebrew/opt/llvm/bin/lldb-dap",
            name = "lldb",
        }

        dap.configurations.rust = {
            {
                name = "Launch",
                type = "lldb",
                request = "launch",
                program = function()
                    return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
            },
        }

        dap.configurations.c = dap.configurations.rust
        dap.configurations.cpp = dap.configurations.rust
    end,

    keys = {
        { "<leader>dc", function() require("dap").continue() end,          desc = "Continue" },
        { "<leader>db", function() require("dap").toggle_breakpoint() end,  desc = "Toggle Breakpoint" },
        { "<leader>di", function() require("dap").step_into() end,         desc = "Step Into" },
        { "<leader>do", function() require("dap").step_over() end,         desc = "Step Over" },
        { "<leader>dO", function() require("dap").step_out() end,          desc = "Step Out" },
        { "<leader>dq", function() require("dap").terminate() end,         desc = "Terminate" },
        { "<leader>du", function() require("dapui").toggle() end,          desc = "Toggle UI" },
    },
}
