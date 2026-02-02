return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup({
                log_level = vim.log.levels.DEBUG
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd", "powershell_es", "jdtls", "lemminx"},
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.glsl_analyzer.setup{}
            lspconfig.lua_ls.setup{}
            lspconfig.clangd.setup{}
            lspconfig.jdtls.setup{}
            lspconfig.lemminx.setup{}

            lspconfig.powershell_es.setup{
                bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services/",
            }


            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "def", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
