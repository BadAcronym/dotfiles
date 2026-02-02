return {
    {
        "nvim-telescope/telescope.nvim",
        event = { "BufRead", "BufNewFile" },
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>fb", ":Telescope file_browser<cr>" },
            { "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>" },
            { "<leader>fd", "<cmd>lua require('telescope.builtin').diagnostics()<CR>" },
            { "<leader>fz", ":Telescope zoxide list<CR>" },
            {
                "<C-p>",
                "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<CR>",
            },
        },
        config = function()
            require("telescope").setup({
                pickers = {
                    colorscheme = {
                        enable_preview = true,
                    },
                    find_files = {
                        hidden = true,
                        find_command = {
                            "rg",
                            "--files",
                            "--glob",
                            "!{.git/*,.next/*,.svelte-kit/*,target/*,node_modules/*}",
                            "--path-separator",
                            "/",
                        },
                    },
                },
            })

            require("telescope").load_extension("zoxide")

            require("telescope").load_extension("ui-select")
        end,
    },

    {
        "nvim-telescope/telescope-ui-select.nvim",
        lazy = true,
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
    {
        "jvgrootveld/telescope-zoxide",
        lazy = true,
    },
}
