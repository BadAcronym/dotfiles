return
{
    "FabijanZulj/blame.nvim",
    lazy = true,
    keys =
    {
        { "<leader>bl", "<cmd>BlameToggle<CR>" },
    },
    config = function()
        require('blame').setup(
        {
            date_format             = "%d.%m.%Y",
            virtual_style           = "right_align",
            relative_date_if_recent = true,
            views =
            {
                window  = window_view,
                virtual = virtual_view,
                default = window_view,
            },
            focus_blame        = true,
            merge_consecutive  = false,
            max_summary_width  = 30,
            colors             = nil,
            blame_options      = nil,
            commit_detail_view = "vsplit",
            mappings =
            {
                commit_info    = "i",
                stack_push     = "<TAB>",
                stack_pop      = "<BS>",
                show_commit    = "<CR>",
                close          = { "<esc>", "q" },
            }
        })
    end
}
