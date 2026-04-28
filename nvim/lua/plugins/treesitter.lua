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
