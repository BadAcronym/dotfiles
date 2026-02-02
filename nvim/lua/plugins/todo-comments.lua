return {
	"folke/todo-comments.nvim",
	lazy = true,
	event = "LspAttach",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    main = "todo-comments",
	opts = {
		highlight = {
			comments_only = true,
		},
		keywords = {
			FIX   = { icon = " ", color = "error",   alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
			TODO  = { icon = " ⃞ ", color = "info" },
			HACK  = { icon = " ", color = "warning" },
			WARN  = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
			PERF  = { icon = " ",                    alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE  = { icon = " ", color = "hint",    alt = { "INFO", "COMMENT", "HINT" } },
			TEST  = { icon = "⏲ ", color = "test",    alt = { "TESTING", "PASSED", "FAILED", "RESULT" } },
			TODAY = { icon = "! ", color = "today",   alt = {"DAY", "CURRENT", "2DAY"} },
			WORK  = { icon = "⅄ ", color = "work",    alt = {"WIP", "DOING", "WORKING"} },
			LEAK  = { icon = "🗲 ", color = "leak",    alt = {"MEMLEAK", "LEAKING", "ASAN"} },
			LOOK  = { icon = "🌐", color = "lookup",  alt = {"INVESTIGATE", "LOOKUP", "RESEARCH"} },
		},
        merge_keywords = true,
        colors = {
            error   = { "DiagnosticError",   "ErrorMsg",   "#DD4550" },
            warning = { "DiagnosticWarn",    "WarningMsg", "#FBBF24" },
            info    = { "DiagnosticInfo",    "#2563EB" },
            hint    = { "DiagnosticHint",    "#10B981" },
            test    = { "DiagnosticTest",    "#FF00FF" },
            today   = { "DiagnosticUrgent",  "#AA10CC" },
            work    = { "DiagnosticCurrent", "#DD6010" },
            lookup  = { "DiagnosticLookup",  "#4550FF" },
            leak    = { "DiagnosticLeak",    "#FF1520" },
            default = { "Identifier",        "#7C3AED" },
        },
	},
	keys = {
		{ "]]t", "<cmd>lua require('todo-comments').jump_next()<CR>" },
		{ "[[t", "<cmd>lua require('todo-comments').jump_prev()<CR>" },

		{ "]t", "<cmd>lua require('todo-comments').jump_next({ keywords = { 'TODO' } })<CR>" },
		{ "[t", "<cmd>lua require('todo-comments').jump_prev({ keywords = { 'TODO' } })<CR>" },

		{
			"]c",
			"<cmd>lua require('todo-comments').jump_next({ keywords = { 'NOTE', 'INFO', 'HINT', 'COMMENT' } })<CR>",
		},
		{
			"[c",
			"<cmd>lua require('todo-comments').jump_prev({ keywords = { 'NOTE', 'INFO', 'HINT', 'COMMENT' } })<CR>",
		},

		{
			"]f",
			"<cmd>lua require('todo-comments').jump_next({ keywords = { 'FIX', 'FIXME', 'BUG', 'FIXIT', 'ISSUE', 'ERROR' } })<CR>",
		},
		{
			"[f",
			"<cmd>lua require('todo-comments').jump_prev({ keywords = { 'FIX', 'FIXME', 'BUG', 'FIXIT', 'ISSUE', 'ERROR' } })<CR>",
		},

		{
			"]w",
			"<cmd>lua require('todo-comments').jump_next({ keywords = { 'HACK', 'WARNING', 'XXX' } })<CR>",
		},
		{
			"[w",
			"<cmd>lua require('todo-comments').jump_prev({ keywords = { 'HACK', 'WARNING', 'XXX' } })<CR>",
		},

		{
			"]r",
			"<cmd>lua require('todo-comments').jump_next({ keywords = { 'TEST', 'RESULT', 'TESTING', 'PASSED', 'FAILED' } })<CR>",
		},
		{
			"[r",
			"<cmd>lua require('todo-comments').jump_prev({ keywords = { 'TEST', 'RESULT', 'TESTING', 'PASSED', 'FAILED' } })<CR>",
		},

		{
			"]p",
			"<cmd>lua require('todo-comments').jump_next({ keywords = { 'PERF', 'PERFORMANCE', 'OPTIMIZE', 'OPTIM' } })<CR>",
		},
		{
			"[p",
			"<cmd>lua require('todo-comments').jump_prev({ keywords = { 'PERF', 'PERFORMANCE', 'OPTIMIZE', 'OPTIM' } })<CR>",
		},

		{ "<leader>tl", "<cmd>TodoTelescope<CR>" },
		{ "<leader>tq", "<cmd>TodoQuickFix<CR>" },
	},
}
