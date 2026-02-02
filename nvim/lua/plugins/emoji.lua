return {
    {
        "allaman/emoji.nvim",
        ft = "markdown",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
            "nvim-telescope/telescope.nvim",
            "ibhagwan/fzf-lua",
        },
        config = function()
            require("emoji").setup({
                enable_cmp_integration = true,
            })
            require("fzf-lua").register_ui_select()
            local ts = require("telescope").load_extension("emoji")
            vim.keymap.set("n", "<leader>se", ts.emoji, { desc = "[S]earch [E]moji" })
        end,
    },
}
