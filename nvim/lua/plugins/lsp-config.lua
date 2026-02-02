return {
	{
		"williamboman/mason.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("mason").setup({
				log_level = vim.log.levels.DEBUG,
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
            "williamboman/mason.nvim"
        },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"asm_lsp",
					"lua_ls",
					"clangd",
					"powershell_es",
					"lemminx",
					"jdtls",
					"tinymist",
				},
                automatic_enable = false
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp"
        },
		--TODO: find out how to quickly jump to next reference/definition
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = vim.tbl_deep_extend(
				"force",
				vim.lsp.protocol.make_client_capabilities(),
				require("cmp_nvim_lsp").default_capabilities()
			)

			capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

			lspconfig.glsl_analyzer.setup({ capabilities = capabilities })

			lspconfig.lua_ls.setup({ capabilities = capabilities })

			lspconfig.clangd.setup({
				capabilities = capabilities,
				cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy=false"
                },
			})

			lspconfig.lemminx.setup({ capabilities = capabilities })

			lspconfig.asm_lsp.setup({
				capabilities = capabilities,
				cmd = { "asm-lsp" },
				filetypes = { "asm", "vmasm" },
				root_dir = require("lspconfig.util").find_git_ancestor,
			})

			lspconfig.powershell_es.setup({
				capabilities = capabilities,
				bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services/",
			})

			lspconfig.tinymist.setup({ capabilities = capabilities })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "dec", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "def", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "ref", vim.lsp.buf.references, {})
			vim.keymap.set("n", "ren", vim.lsp.buf.rename, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
		end,
	},
	{
		"mfussenegger/nvim-jdtls",
	},
}
