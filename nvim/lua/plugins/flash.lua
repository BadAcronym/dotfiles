return {
    "folke/flash.nvim",
    keys = {
        {"zk",    mode = {"n", "x", "o"}, function() require("flash").jump()              end, },
        {"Zk",    mode = {"n", "x", "o"}, function() require("flash").treesitter()        end, },
        {"r",     mode = {"o"},           function() require("flash").remote()            end, },
        {"R",     mode = {"x", "o"},      function() require("flash").treesitter_search() end, },
        {"<c-f>", mode = {"c"},           function() require("flash").toggle()            end, },
    }
}
