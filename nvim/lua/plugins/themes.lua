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
                    ["@label"] = { fg = "#FF1020"},

                    ["@constant"] = { fg = "#F080FF"},
                    ["@variable"] = { fg = "#209FAA"},
                    ["@variable.member"] = { fg = "#30FFAA" },
                    ["@variable.parameter"] = { fg = "#3090FF"},

                    ["@keyword.conditional"] = { fg = "#D8B2FF" },
                    ["@boolean"] = { fg = "#BB45FF" },

                    ["@number"] = { fg = "#3AAAE6" },


                    ["@type"] = { fg = "#3AFFE6"},
                    ["@type.builtin"] = { fg = "#3AFFE6"},
                    ["@type.definition"] = { fg = "#3AFFE6"},

                    ["@string"] = { fg = "#99DD20"},
                    ["@string.regexp"] = { fg = "#F080FF"},
                    ["@string.escape"] = { fg = "#F080FF"},

                    ["@punctuation.delimiter"] = { fg = "#FFFFFF"},
                    ["@punctuation.bracket"] = { fg = "#d65d0e"},
                    ["@punctuation.special"] = { fg = "#F0C0FA"},
                },
				dim_inactive = false,
				transparent_mode = false,
			})
		end,
	},
}
