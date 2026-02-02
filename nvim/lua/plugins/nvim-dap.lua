return {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
        "Willem-J-an/nvim-dap-powershell",
        "tomblind/local-lua-debugger-vscode",
        {
            "m00qek/baleia.nvim",
            lazy = true,
            tag = "v1.4.0",
        },
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
        "williamboman/mason.nvim",
    },
    config = function()
        local dap = require("dap")
        local ui = require("dapui")

        require("dapui").setup()
        require("dap-powershell").setup()

        dap.adapters["local-lua"] = {
            type = "executable",
            command = "node",
            args = {
                vim.fn.stdpath("data") .. "/lazy/local-lua-debugger-vscode/extension/debugAdapter.ts",
            },
            enrich_config = function(config, on_config)
                if not config["extensionPath"] then
                    local c = vim.deepcopy(config)
                    c.extensionPath = vim.fn.stdpath("data")
                        .. "/lazy/local-lua-debugger-vscode/"
                    on_config(c)
                else
                    on_config(config)
                end
            end,
        }

        --TODO: fix via https://zignar.net/2023/06/10/debugging-lua-in-neovim
        dap.configurations.lua = {
            {
                name = "Current file (local-lua-dbg, lua)",
                type = "local-lua",
                request = "launch",
                cwd = "${workspaceFolder}",
                program = {
                    lua = "lua5.1",
                    file = "${file}",
                },
                args = {},
            },
        }

        dap.adapters.gdb = {
            type = "executable",
            command = "gdb",
            args = { "--interpreter=dap", "--eval-command", "set print pretty on"},
        }

        --FIXME: fix pending breakpoints (gdb issue?)
        --"no source file named snek.asm" (path is correct). <-- probable root issue
        dap.configurations.asm = {
            {
                name = "Launch",
                type = "gdb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "\\bin\\", "file")
                end,
                cwd = "${workspaceFolder}\\bin\\",
                stopAtBeginningOfMainSubprogram = false,
            },
            {
                name = "Select and attach to process",
                type = "gdb",
                request = "attach",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "\\", "file")
                end,
                pid = function()
                    local name = vim.fn.input("Executable name (filter): ")
                    return require("dap.utils").pick_process({ filter = name })
                end,
                cwd = "${workspaceFolder}\\bin\\",
            },
        }

        dap.configurations.c = {
            {
                name = "Launch",
                type = "gdb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "\\bin\\", "file")
                end,
                cwd = "${workspaceFolder}\\bin\\",
                stopAtBeginningOfMainSubprogram = false,
            },
            {
                name = "Select and attach to process",
                type = "gdb",
                request = "attach",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "\\bin\\", "file")
                end,
                pid = function()
                    local name = vim.fn.input("Executable name (filter): ")
                    return require("dap.utils").pick_process({ filter = name })
                end,
                cwd = "${workspaceFolder}\\bin\\",
            },
        }

        dap.listeners.before.attach.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            ui.close()
        end

        --fix pwsh error messages
        dap.listeners.after.event_initialized["dapui_config"] = function()
            ui.open()
            require("dap-powershell").correct_repl_colors()
        end
    end,
    keys = {
        { "<leader>mb",  "<cmd>lua require('dap').toggle_breakpoint()<CR>" },
        { "<leader>nt",  "<cmd>lua require('dap').continue()<CR>" },
        { "<leader>in",  "<cmd>lua require('dap').step_into()<CR>" },
        { "<leader>ov",  "<cmd>lua require('dap').step_over()<CR>" },
        { "<leader>ot",  "<cmd>lua require('dap').setp_out()<CR>" },
        { "<leader>bk",  "<cmd>lua require('dap').step_back()<CR>" },
        { "<leader>re",  "<cmd>lua require('dap').restart()<CR>" },
        { "<leader>run", "<cmd>lua require('dap').run_to_cursor()<CR>" },

        { "<leader>tui",  "<cmd>lua require('dapui').toggle()<CR>" },
    },
}
