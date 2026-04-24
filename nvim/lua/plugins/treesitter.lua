return
{
    {
        "nvim-treesitter/playground"
    },
	{
		"nvim-treesitter/nvim-treesitter-context",
		build = ":TSUpdate",
		lazy  = true,
		event = { "BufRead", "BufNewFile" },
		config = function()
			require("treesitter-context").setup({
				enable       = true,
				line_numbers = true,
                max_lines    = 5,
                trim_scope   = 'inner',
                separator    = '-'
			})
		end,
		vim.keymap.set("n", "[c", function()
			require("treesitter-context").go_to_context(vim.v.count1)
		end, { silent = true }),
	},
    -- TODO: find a replacement for nvim-treesitter-textobjects
}
