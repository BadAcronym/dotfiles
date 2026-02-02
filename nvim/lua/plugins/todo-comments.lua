return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      highlight = {
        comments_only = false,
      }
    },
    config = function()
      vim.keymap.set("n", "]t", function()
        require("todo-comments").jump_next()
      end, { desc = "Next todo comment" })

      vim.keymap.set("n", "[t", function()
        require("todo-comments").jump_prev()
      end, { desc = "Previous todo comment" })

      vim.keymap.set("n", "]t", function()
        require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
      end, { desc = "Next error/warning todo comment" })  
    end
}
