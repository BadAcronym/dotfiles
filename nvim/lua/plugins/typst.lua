return {
	{
		"chomosuke/typst-preview.nvim",
		lazy = true,
		ft = "typst",
		version = "1.*",
		config = function()
			require("typst-preview").setup()({
				dependencies_bin = {
					["tinymist"] = "tinymist",
				},
			})
		end,
	},
}
