return {
    "nvimdev/lspsaga.nvim",
    keys = {
        { "go", "<cmd>Lspsaga goto_definition<CR>",         mode = "n", noremap = true, silent = true },
        { "gh", "<cmd>Lspsaga finder<CR>",                  mode = "n", noremap = true, silent = true },
        { "<leader>pk", "<cmd>Lspsaga peek_definition<CR>", mode = "n", noremap = true, silent = true },
        { "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>",  mode = "n", noremap = true, silent = true },
        { "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>",  mode = "n", noremap = true, silent = true },
    },
    config = function()
        require("lspsaga").setup()
    end
}
