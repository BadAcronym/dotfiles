return {
	{
		"nvim-treesitter/nvim-treesitter",
		auto_install = true,
		highlight = { enable = true },
		ensure_installed = { "cpp", "lua" },
		indent = { enable = true },
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		-- config = function()
		--     require("treesitter-context").setup({
		--         enable = true,
		--         line_numbers = true,
		--     })
		-- end,
		vim.keymap.set("n", "[c", function()
			require("treesitter-context").go_to_context(vim.v.count1)
		end, { silent = true }),
	},
}
