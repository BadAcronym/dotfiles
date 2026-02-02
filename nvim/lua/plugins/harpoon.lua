return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = true,
		keys = {
			{ "<leader>a", "<cmd>lua require('harpoon'):list():add()<CR>" },
			{ "<C-k>", "<cmd>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<CR>" },
			{ "<C-]>", "<cmd>lua require('harpoon'):list():next()<CR>" },
			{ "<C-[>", "<cmd>lua require('harpoon'):list():prev()<CR>" },
			{ "<C-n>", "<cmd>lua require('harpoon'):list():select(1)<CR>" },
			{ "<C-e>", "<cmd>lua require('harpoon'):list():select(2)<CR>" },
			{ "<C-i>", "<cmd>lua require('harpoon'):list():select(3)<CR>" },
			{ "<C-o>", "<cmd>lua require('harpoon'):list():select(4)<CR>" },
		},
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()
		end,
		vim.keymap.set("n", "<ESC>", "<ESC>"),
	},
}
