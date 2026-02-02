return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        highlight = {
            comments_only = false,
        },
        keywords = {
            FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
            TODO = { icon = " ", color = "info" },
            HACK = { icon = " ", color = "warning" },
            WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
            PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
            NOTE = { icon = " ", color = "hint", alt = { "INFO", "COMMENT", "HINT" } },
            TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED", "RESULT" } },
        },
    },
    config = function()
        require("todo-comments").setup()

        vim.keymap.set("n", "]]t", function()
            require("todo-comments").jump_next()
        end, { desc = "Next keyword comment" })

        vim.keymap.set("n", "[[t", function()
            require("todo-comments").jump_prev()
        end, { desc = "Previous keyword comment" })

        vim.keymap.set("n", "]t", function()
            require("todo-comments").jump_next({ keywords = { "TODO" } })
        end, { desc = "Next todo comment" })

        vim.keymap.set("n", "[t", function()
            require("todo-comments").jump_prev({ keywords = { "TODO" } })
        end, { desc = "Previous todo comment" })

        vim.keymap.set("n", "]c", function()
            require("todo-comments").jump_next({ keywords = { "NOTE", "INFO", "HINT", "COMMENT" } })
        end, { desc = "Next note comment" })

        vim.keymap.set("n", "[c", function()
            require("todo-comments").jump_prev({ keywords = { "NOTE", "INFO", "HINT", "COMMENT" } })
        end, { desc = "Previous note comment" })

        vim.keymap.set("n", "]f", function()
            require("todo-comments").jump_next({ keywords = { "FIX", "FIXME", "BUG", "FIXIT", "ISSUE", "ERROR" } })
        end, { desc = "Next fixme comment" })

        vim.keymap.set("n", "[f", function()
            require("todo-comments").jump_prev({ keywords = { "FIX", "FIXME", "BUG", "FIXIT", "ISSUE", "ERROR" } })
        end, { desc = "Previous fixme comment" })

        vim.keymap.set("n", "]w", function()
            require("todo-comments").jump_next({ keywords = { "HACK", "WARNING", "XXX" } })
        end, { desc = "Next fixme comment" })

        vim.keymap.set("n", "[w", function()
            require("todo-comments").jump_prev({ keywords = { "HACK", "WARNING", "XXX" } })
        end, { desc = "Previous fixme comment" })

        vim.keymap.set("n", "]r", function()
            require("todo-comments").jump_next({ keywords = { "TEST", "RESULT", "TESTING", "PASSED", "FAILED" } })
        end, { desc = "Next test comment" })

        vim.keymap.set("n", "[r", function()
            require("todo-comments").jump_prev({ keywords = { "TEST", "RESULT", "TESTING", "PASSED", "FAILED" } })
        end, { desc = "Previous test comment" })

        vim.keymap.set("n", "]p", function()
            require("todo-comments").jump_next({ keywords = { "PERF", "PERFORMANCE", "OPTIMIZE", "OPTIM" } })
        end, { desc = "Next performance comment" })

        vim.keymap.set("n", "[p", function()
            require("todo-comments").jump_prev({ keywords = { "PERF", "PERFORMANCE", "OPTIMIZE", "OPTIM" } })
        end, { desc = "Previous performance comment" })

        vim.keymap.set("n", "<leader>tl", ":TodoTelescope<CR>")
        vim.keymap.set("n", "<leader>tq", ":TodoQuickFix<CR>")
    end,
}
