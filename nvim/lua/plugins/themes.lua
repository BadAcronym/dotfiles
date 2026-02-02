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

                    ["@constant"] = { fg = "#f080ff"},
                    ["@variable"] = { fg = "#209faa"},
                    ["@variable.member"] = { fg = "#30ffaa" },
                    ["@variable.parameter"] = { fg = "#3090ff"},

                    ["@keyword.conditional"] = { fg = "#d8b2ff" },
                    ["@boolean"] = { fg = "#bb45ff" },

                    ["@number"] = { fg = "#3aaae6" },


                    ["@type"] = { fg = "#3affe6"},
                    ["@type.builtin"] = { fg = "#3affe6"},
                    ["@type.definition"] = { fg = "#3affe6"},

                    ["@string"] = { fg = "#99dd20"},
                    ["@string.regexp"] = { fg = "#f080ff"},
                    ["@string.escape"] = { fg = "#f080ff"},

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
