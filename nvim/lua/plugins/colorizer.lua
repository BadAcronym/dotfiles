return {
	"NiklasV1/nvim-colorizer.lua",
	lazy = true,
	event = {"BufReadPre", "BufNewFile"},
	config = function()
		require("colorizer").setup({
			"*",
            css = { rgb_fn = true },
		})
	end,
    mode = "foreground"
}
