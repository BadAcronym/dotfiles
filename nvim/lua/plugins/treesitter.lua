return
{
    {
        'nvim-treesitter/nvim-treesitter',
        branch = "main",
        opts =
        {
            highlight = { enable = true },
            indent = { enable = true },
        },
        init = function()
            local ensureInstalled =
            {
                'c',
                'cpp',
                'vim',
                'lua',
                'bash',
                'json',
                'glsl',
                'typst',
                'markdown',
            }
            local alreadyInstalled = require('nvim-treesitter.config').get_installed()
            local parsersToInstall = vim.iter(ensureInstalled)
                :filter(function(parser)
                    return not vim.tbl_contains(alreadyInstalled, parser)
                end)
                :totable()
            require('nvim-treesitter').install(parsersToInstall)

            vim.api.nvim_create_autocmd('FileType', {
                callback = function()
                    pcall(vim.treesitter.start)
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
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
        'nvim-treesitter/nvim-treesitter-textobjects',
        config = function()
            require("nvim-treesitter-textobjects").setup({
                move =
                {
                    set_jumps = true,
                },
                select =
                {
                    enable    = true,
                    lookahead = true,
                    selection_modes =
                    {
                        ["@parameter.outer"] = "v",
                        ["@function.outer"]  = "V",
                        ['@class.outer']     = '<c-v>',
                    },
              },
            })
        end,
        keys =
        {
            -- lazy format:
            -- { "<leader>fb", ":Telescope file_browser<cr>" },
            -- { "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>" },

            -- TODO: translate the following keybinds.

            -- You can use the capture groups defined in `textobjects.scm`
            -- vim.keymap.set({ "x", "o" }, "am", function()
            --   require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
            -- end)
            -- vim.keymap.set({ "x", "o" }, "im", function()
            --   require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
            -- end)
            -- vim.keymap.set({ "x", "o" }, "ac", function()
            --   require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
            -- end)
            -- vim.keymap.set({ "x", "o" }, "ic", function()
            --   require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
            -- end)
            -- -- You can also use captures from other query groups like `locals.scm`
            -- vim.keymap.set({ "x", "o" }, "as", function()
            --   require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "locals")
            -- end)
            -- vim.keymap.set("n", "<leader>a", function()
            --   require("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner"
            -- end)
            -- vim.keymap.set("n", "<leader>A", function()
            --   require("nvim-treesitter-textobjects.swap").swap_previous "@parameter.outer"
            -- end)

            -- vim.keymap.set({ "n", "x", "o" }, "]m", function()
            --   require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
            -- end)
            -- vim.keymap.set({ "n", "x", "o" }, "]]", function()
            --   require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
            -- end)
            -- -- You can also pass a list to group multiple queries.
            -- vim.keymap.set({ "n", "x", "o" }, "]o", function()
            --   require("nvim-treesitter-textobjects.move").goto_next_start({"@loop.inner", "@loop.outer"}, "textobjects")
            -- end)
            -- -- You can also use captures from other query groups like `locals.scm` or `folds.scm`
            -- vim.keymap.set({ "n", "x", "o" }, "]s", function()
            --   require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals")
            -- end)
            -- vim.keymap.set({ "n", "x", "o" }, "]z", function()
            --   require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
            -- end)
            --
            -- vim.keymap.set({ "n", "x", "o" }, "]M", function()
            --   require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
            -- end)
            -- vim.keymap.set({ "n", "x", "o" }, "][", function()
            --   require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
            -- end)
            --
            -- vim.keymap.set({ "n", "x", "o" }, "[m", function()
            --   require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
            -- end)
            -- vim.keymap.set({ "n", "x", "o" }, "[[", function()
            --   require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
            -- end)
            --
            -- vim.keymap.set({ "n", "x", "o" }, "[M", function()
            --   require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
            -- end)
            -- vim.keymap.set({ "n", "x", "o" }, "[]", function()
            --   require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
            -- end)
            --
            -- vim.keymap.set({ "n", "x", "o" }, "]d", function()
            --   require("nvim-treesitter-textobjects.move").goto_next("@conditional.outer", "textobjects")
            -- end)
            -- vim.keymap.set({ "n", "x", "o" }, "[d", function()
            --   require("nvim-treesitter-textobjects.move").goto_previous("@conditional.outer", "textobjects")
            -- end)
        }
    },
    -- FIXME: doesn't work rn
    -- {
    --     'nvim-treesitter/playground',
    --     require "nvim-treesitter".setup
    --     {
    --         playground =
    --         {
    --             enable          = true,
    --             disable         = {},
    --             updatetime      = 25,
    --             persist_queries = false,
    --             keybindings     =
    --             {
    --                 toggle_query_editor = 'o',
    --                 toggle_hl_groups = 'i',
    --                 toggle_injected_languages = 't',
    --                 toggle_anonymous_nodes = 'a',
    --                 toggle_language_display = 'I',
    --                 focus_language = 'f',
    --                 unfocus_language = 'F',
    --                 update = 'R',
    --                 goto_node = '<cr>',
    --                 show_help = '?',
    --             },
    --         }
    --     }
    -- }
}
