return {
	{
		"allaman/emoji.nvim",
		lazy = true,
		ft = "md",
		config = function()
			require("emoji").setup({
				enable_cmp_integration = true,
			})
		end,
		keys = {
			{
				"<leader>se",
				"<cmd>lua require('telescope').load_extension('emoji').emoji()<CR>",
				desc = "[S]earch [E]moji",
			},
		},
	},
}
