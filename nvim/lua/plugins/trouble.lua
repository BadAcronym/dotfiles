return {
	"folke/trouble.nvim",
    lazy = true,
	config = function()
		require("trouble").setup({})
	end,
	opts = {},
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
	},
}
