return {
	"norcalli/nvim-colorizer.lua",
	lazy = true,
	event = "LspAttach",
	config = function()
		require("colorizer").setup({ "*", css = { rgb_fn = true } })
	end,
}
