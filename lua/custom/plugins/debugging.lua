return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            local dapui = require("dapui")
            dapui.setup()

            local dap = require("dap")
            -- Automatically open/close dap-ui on debugger events
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dap.set_log_level("TRACE")

            -- Keybindings for DAP
            vim.keymap.set("n", "<leader>dt", function()
                dap.toggle_breakpoint()
            end, { desc = "Toggle breakpoint" })
            vim.keymap.set("n", "<leader>dc", function()
                dap.continue()
            end, { desc = "Start/continue debugging" })
            vim.keymap.set("n", "<leader>do", function()
                dap.step_over()
            end, { desc = "Step over" })
            vim.keymap.set("n", "<leader>di", function()
                dap.step_into()
            end, { desc = "Step into" })

            -- DAP Adapter for C++ (VSCode cpptools)
            dap.adapters.cppdbg = {
                id = "cppdbg",
                type = "executable",
                command =
                "/home/stlmuelk/.vscode-server/extensions/ms-vscode.cpptools-1.22.11-linux-x64/debugAdapters/bin/OpenDebugAD7",
            }

            -- Configurations for C++ and C
            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopAtEntry = true,
                },
                {
                    name = "Attach to gdbserver :1234",
                    type = "cppdbg",
                    request = "launch",
                    MIMode = "gdb",
                    miDebuggerServerAddress = "localhost:1234",
                    miDebuggerPath = "/usr/bin/gdb",
                    cwd = "${workspaceFolder}",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                },
            }
            dap.configurations.c = dap.configurations.cpp
        end,
    },
}

