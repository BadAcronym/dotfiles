return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      highlight = {
        comments_only = false,
      }
    },
    config = function()
        require("todo-comments").setup()
            vim.keymap.set("n", "]t", function()
                require("todo-comments").jump_next()
            end, { desc = "Next marked comment" })

            vim.keymap.set("n", "[t", function()
                require("todo-comments").jump_prev()
            end, { desc = "Previous marked comment" })


            vim.keymap.set("n", "t]", function()
                require("todo-comments").jump_next({keywords = {"TODO",}})
            end, { desc = "Next todo comment" })

            vim.keymap.set("n", "t[", function()
                require("todo-comments").jump_prev({keywords = {"TODO",}})
            end, { desc = "Previous todo comment" })


            vim.keymap.set("n", "]]t", function()
                require("todo-comments").jump_next({keywords = { "ERROR", "WARNING", "BUG", "FIXME",}})
            end, { desc = "Next error/warning todo comment" })

            vim.keymap.set("n", "[[t", function()
                require("todo-comments").jump_prev({keywords = { "ERROR", "WARNING", "BUG", "FIXME",}})
            end, { desc = "Previous error/warning todo comment" })
    end
}
