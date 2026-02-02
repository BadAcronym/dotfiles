return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = false,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true,
				contrast = "hard",
				palette_overrides = {},
				overrides = {
                    ["@string"] = { fg = "#99FF20" },
                    ["String"] = { fg  = "#99FF20" },

                    ["Type"] = { fg  = "#9090FF" },
                    ["@type"] = { fg  = "#3AFFFF" },

                    ["Function"] = { fg = "#FFDD25" },
                    ["@function"] = { fg = "#FFDD25" },

                    ["Operator"] = { fg = "#FFFFFF" },

                    ["StorageClass"] = { fg = "#C070FF" },
                },
				dim_inactive = false,
				transparent_mode = false,
			})
		end,
	},
}
