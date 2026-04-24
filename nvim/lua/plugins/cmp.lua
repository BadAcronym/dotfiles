return
{
	{
		"hrsh7th/cmp-nvim-lsp",
		lazy = true,
		event = { "BufRead", "BufNewFile" },
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = true,
		event = "InsertEnter",
		config = function()
			local cmp = require("cmp")
			cmp.setup(
            {
				window =
                {
					completion    = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert(
                {
					["<C-b>"]     = cmp.mapping.scroll_docs(-4),
					["<C-f>"]     = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"]     = cmp.mapping.abort(),
					["<CR>"]      = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources(
                {
					{ name = "buffer", keyword_length = 5 },
					{ name = "nvim_lsp" },
                    { name = "path" },
                })
            })
	    end,
	},
    {
        "hrsh7th/cmp-path"
    },
}
