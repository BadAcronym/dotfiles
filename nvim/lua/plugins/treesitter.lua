return
{
	{
		"nvim-treesitter/nvim-treesitter",
		lazy  = false,
		build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                auto_install = true,
                highlight =
                {
                    enable = true,
                    additional_vim_regex_highlighting = false
                },
                ensure_installed = {
                    "c",
                    "bash",
                    "glsl",
                    "markdown",
                    "lua",
                    "vim",
                    "html",
                    "json",
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
    {
        "nvim-treesitter/playground"
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter" },
        config = function()
          require("nvim-treesitter.configs").setup({
              textobjects = {
                  move = {
                      enable    = true,
                      set_jumps = true,
                      goto_next_start = {
                          ["]f"] = "@function.outer",
                      },
                      goto_next_end = {
                          ["]F"] = "@function.outer",
                      },
                      goto_previous_start = {
                          ["[f"] = "@function.outer",
                      },
                      goto_previous_end = {
                          ["[F"] = "@function.outer",
                      },
                  },
                  select = {
                      enable    = true,
                      lookahead = true,
                      keymaps = {
                          ["af"] = "@function.outer",
                          ["if"] = "@function.inner",
                          ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
                      },
                      selection_modes = {
                          ["@parameter.outer"] = "v", -- charwise
                          ["@function.outer"]  = "V", -- linewise
                      },
                      include_surrounding_whitespace = true,
                  },
              },
            })
        end
    },
}
