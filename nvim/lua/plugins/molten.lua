return {
    "benlubas/molten-nvim",
    version = "^1.1.0", -- use version <2.0.0 to avoid breaking changes
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    -- keys = {
        -- {"<leader>er", mode = "n", ":MoltenReevaluateCell<CR>"},
        -- {"<leader>ev", mode = "v", ":<C-u>MoltenEvaluateVisual<CR>gv"},
        -- {"<leader>eh", mode = "n", ":MoltenHideOutput<CR>"},
        -- {"<leader>ed", mode = "n", ":MoltenDelete<CR>"},
    -- },
    init = function()
        vim.g.molten_image_provider = "image.nvim"
        vim.g.molten_output_win_max_height = 20
        -- vim.keymap.set("n", "<localleader>er", ":MoltenReevaluateCell<CR>", { desc = "re-eval cell", silent = true })
        -- vim.keymap.set("v", "<localleader>ev", ":<C-u>MoltenEvaluateVisual<CR>gv", { desc = "execute visual selection", silent = true })
        -- vim.keymap.set("n", "<localleader>eh", ":MoltenHideOutput<CR>", { desc = "close output window", silent = true })
        -- vim.keymap.set("n", "<localleader>ed", ":MoltenDelete<CR>", { desc = "delete Molten cell", silent = true })
        -- vim.keymap.set("n", "<localleader>ex", ":MoltenOpenInBrowser<CR>", { desc = "open output in browser", silent = true })
        vim.keymap.set("n", "<leader>er", ":MoltenReevaluateCell<CR>", { desc = "re-eval cell", silent = true })
        vim.keymap.set("v", "<leader>ev", ":<C-u>MoltenEvaluateVisual<CR>gv", { desc = "execute visual selection", silent = true })
        vim.keymap.set("n", "<leader>eh", ":MoltenHideOutput<CR>", { desc = "close output window", silent = true })
        vim.keymap.set("n", "<leader>ed", ":MoltenDelete<CR>", { desc = "delete Molten cell", silent = true })
        vim.keymap.set("n", "<leader>ex", ":MoltenOpenInBrowser<CR>", { desc = "open output in browser", silent = true })
    end,
    filetypes = {"markdown", },
}
