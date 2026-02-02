return {
	"nvim-lualine/lualine.nvim",
	lazy = true,
	event = { "BufRead", "BufNewFile", "LspAttach" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "gruvbox-material",
			},
		})
	end,
}
