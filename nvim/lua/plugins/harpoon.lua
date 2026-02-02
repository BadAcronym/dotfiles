return {
    {
        "ThePrimeagen/harpoon",
        config = function()
            HarpoonUI = require("harpoon.ui")
            local harpoon = require("harpoon")
            harpoon.setup()
        end,
        keys = {
            { "<leader>a", function() require("harpoon.mark").add_file() end, desc = "harpoon file", },
            { "<C-k>", function() HarpoonUI.toggle_quick_menu() end, desc = "harpoon quick menu", },
            { "<C-]>", function() HarpoonUI.nav_next() end, desc = "harpoon to file 4", },
            { "<C-[>", function() HarpoonUI.nav_prev() end, desc = "harpoon to file 4", },
            { "<C-n>", function() HarpoonUI.nav_file(1) end, desc = "harpoon to file 1", },
            { "<C-e>", function() HarpoonUI.nav_file(2) end, desc = "harpoon to file 2", },
            { "<C-i>", function() HarpoonUI.nav_file(3) end, desc = "harpoon to file 3", },
            { "<C-o>", function() HarpoonUI.nav_file(4) end, desc = "harpoon to file 4", },
            { "<C-a>", function() HarpoonUI.nav_file(5) end, desc = "harpoon to file 5", },
            { "<C-r>", function() HarpoonUI.nav_file(6) end, desc = "harpoon to file 6", },
            { "<C-s>", function() HarpoonUI.nav_file(7) end, desc = "harpoon to file 7", },
        },
    }
}
