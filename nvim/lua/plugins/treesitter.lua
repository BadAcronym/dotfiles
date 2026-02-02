return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		-- event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false
                },
                ensure_installed = {
                    "cpp",
                    "c",
                    "cpp",
                    "glsl",
                    "lua",
                    "java",
                    "vim",
                    "html",
                    "json",
                    "markdown",
                    "powershell",
                    "python",
                    "xml",
                    "yaml",
                },
                indent = { enable = true },
            })
        end
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		build = ":TSUpdate",
		lazy = true,
		event = { "BufRead", "BufNewFile" },
		config = function()
			require("treesitter-context").setup({
				enable = true,
				line_numbers = true,
			})
		end,
		vim.keymap.set("n", "[c", function()
			require("treesitter-context").go_to_context(vim.v.count1)
		end, { silent = true }),
	},
}
