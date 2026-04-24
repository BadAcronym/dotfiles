return
{
    "ej-shafran/compile-mode.nvim",
    lazy = true,
    branch = "latest",
    dependencies =
    {
        "nvim-lua/plenary.nvim",
        "m00qek/baleia.nvim"
    },
    keys =
    {
        { "<C-c>", "<cmd>Compile ./run release --compile-only<CR><CR>" },
        { "<C-r>", "<cmd>Compile ./run<CR><CR>" },
        { "<leader><C-c>", "<cmd>Compile<CR>" },
    },
    config = function()
        ---@module "compile-mode"
        ---@type CompileModeOpts
        vim.g.compile_mode =
        {
            default_command =
            {
                c   = "./run",
                typ = "./run"
            },
            default_command               = "./run",
            baleia_setup                  = true,
            bang_expansion                = false,
            directory_change_matchers     = {},
            error_regexp_table            = {},
            error_ignore_file_list        = {},
            error_threshold               = require("compile-mode").level.WARNING,
            auto_jump_to_first_error      = false,
            error_locus_highlight         = 500,
            use_diagnostics               = false,
            recompile_no_fail             = false,
            ask_about_save                = true,
            ask_to_interrupt              = true,
            buffer_name                   = "*compilation*",
            time_format                   = "%a %b %e %H:%M:%S",
            hidden_output                 = {},
            environment                   = nil,
            clear_environment             = false,
            input_word_completion         = true,
            hidden_buffer                 = false,
            focus_compilation_buffer      = true,
            auto_scroll                   = true,
            use_circular_error_navigation = true,
            debug                         = false,
            use_pseudo_terminal           = false,
        }
    end
}
