return
{
    "Wansmer/treesj",
    lazy = true,
    keys =
    {
        { "trm", "<cmd> lua require('treesj').toggle()<CR>", mode = {"n", "v"} },
        { "trs", "<cmd> lua require('treesj').split() <CR>", mode = {"n", "v"} },
        { "trj", "<cmd> lua require('treesj').join()  <CR>", mode = {"n", "v"} }
    },
    config = function()
        require("treesj").setup({})
    end
}
