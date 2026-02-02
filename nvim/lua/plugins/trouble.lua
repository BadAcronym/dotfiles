return {
	"folke/trouble.nvim",
    lazy = true,
	config = function()
		require("trouble").setup({})
	end,
	opts = {},
	cmd = "Trouble",
	keys = {
		{"<leader>di", "<cmd>Trouble diagnostics toggle<CR>"},
        {"<C-h>", "<cmd>Trouble diagnostics next focus=true<CR>"},
        {"<C-d>", "<cmd>Trouble diagnostics prev focus=true<CR>"},
	},
}
