return
{
    'willothy/moveline.nvim',
    build = 'make',
    keys =
    {
        { "<M-k>", "<cmd>lua require('moveline'):up()<CR>",         mode = "n" },
        { "<M-k>", "<cmd>lua require('moveline'):block_up()<CR>",   mode = "v" },
        { "<M-j>", "<cmd>lua require('moveline'):down()<CR>",       mode = "n" },
        { "<M-j>", "<cmd>lua require('moveline'):block_down()<CR>", mode = "v" }
    }
}
