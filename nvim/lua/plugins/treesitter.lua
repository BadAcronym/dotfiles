return {
	{
		"nvim-treesitter/nvim-treesitter",
		--build = "TSUpdate",
        auto_install = true,
		highlight = { enable = true },
        ensure_installed = {"cpp", "lua"},
		indent = { enable = true },
	},
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup({
                line_numbers = true,
            })
        end,
    },
}
