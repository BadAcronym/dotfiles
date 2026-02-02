return{
    "nguyenvukhang/nvim-toggler",
    lazy = true,
    keys = {
        {"inv", "<cmd>lua require('nvim-toggler').toggle()<CR>", mode = {"n", "v"}}
    },
    config = function ()
        require('nvim-toggler').setup({
            remove_default_keybinds = true
        })
    end
}
