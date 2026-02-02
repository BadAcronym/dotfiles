return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter" },
    config = function()
      require("nvim-treesitter.configs").setup({
          textobjects = {
              move = {
                  enable = true,
                  set_jumps = true,
                  goto_next_start = {
                      ["[f"] = "@function.outer",
                  },
                  goto_previous_start = {
                      ["]f"] = "@function.outer",
                  },
                  goto_previous_end = {
                      ["[F"] = "@function.outer",
                  },
              },
              select = {
                  enable = true,
                  lookahead = true,
                  keymaps = {
                      ["af"] = "@function.outer",
                      ["if"] = "@function.inner",
                      ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
                  },
                  selection_modes = {
                      ["@parameter.outer"] = "v", -- charwise
                      ["@function.outer"] = "V",  -- linewise
                  },
                  include_surrounding_whitespace = true,
              },
          },
        })
    end
}
