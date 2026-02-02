return{
    "williamboman/mason.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("mason").setup()
    end,
}
