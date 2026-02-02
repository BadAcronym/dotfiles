return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        config = function()
            require("harpoon"):setup()
            vim.keymap.set("n", "<Esc>", "<ESC>")
        end,
        keys = {
            { "<leader>a", function() require("harpoon.mark").add_file() end, desc = "harpoon file", },
            { "<C-k>", function() require("harpoon.ui").toggle_quick_menu() end, desc = "harpoon quick menu", },
            { "<C-]>", function() require("harpoon.ui").nav_next() end, desc = "harpoon to file 4", },
            { "<C-[>", function() require("harpoon.ui").nav_prev() end, desc = "harpoon to file 4", },
            { "<C-n>", function() require("harpoon.ui").nav_file(1) end, desc = "harpoon to file 1", },
            { "<C-e>", function() require("harpoon.ui").nav_file(2) end, desc = "harpoon to file 2", },
            { "<C-i>", function() require("harpoon.ui").nav_file(3) end, desc = "harpoon to file 3", },
            { "<C-o>", function() require("harpoon.ui").nav_file(4) end, desc = "harpoon to file 4", },
        },
    }
}
