return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = "TSUpdate",
        auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
	},
    {
        "nvim-treesitter/nvim-treesitter-context",
        require("treesitter-context").setup({
            line_numbers = true,
        })
    },
}
