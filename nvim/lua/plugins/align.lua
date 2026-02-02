return
{
    "nvim-mini/mini.align",
    lazy = false,
    branch = "main",
    config = function()
        require('mini.align').setup({
            mappings =
            {
                start              = 'ga',
                start_with_preview = 'gA',
            },

            modifiers =
            {
                -- ['s'] = --<function: enter split pattern>,
                -- ['j'] = --<function: choose justify side>,
                -- ['m'] = --<function: enter merge delimiter>,
                --
                -- ['f'] = --<function: filter parts by entering Lua expression>,
                -- ['i'] = --<function: ignore some split matches>,
                -- ['p'] = --<function: pair parts>,
                -- ['t'] = --<function: trim parts>,
                --
                -- ['<BS>'] = --<function: delete some last pre-step>,
                --
                -- ['='] = --<function: enhanced setup for '='>,
                -- [','] = --<function: enhanced setup for ','>,
                -- ['|'] = --<function: enhanced setup for '|'>,
                -- [' '] = --<function: enhanced setup for ' '>,
            },

            options =
            {
                split_pattern   = '',
                justify_side    = 'left',
                merge_delimiter = '',
            },

            steps =
            {
                pre_split   = {},
                split       = nil,
                pre_justify = {},
                justify     = nil,
                pre_merge   = {},
                merge       = nil,
            },
            silent = false,
        })
    end
}
