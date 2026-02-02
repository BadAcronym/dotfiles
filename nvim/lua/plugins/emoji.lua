return{
	{
		"allaman/emoji.nvim",
		ft = "markdown",
		config = function()
			require("emoji").setup({
				enable_cmp_integration = true,
			})
            local ts = require("telescope").load_extension("emoji")
			vim.keymap.set("n", "<leader>se", ts.emoji, { desc = "[S]earch [Emoji]" })
		end,
	},
}
