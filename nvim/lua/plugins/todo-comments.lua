return
{
	"folke/todo-comments.nvim",
	lazy  = true,
    event =
    {
        "BufRead",
        "BufNewFile"
    },
	dependencies =
    {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
    },
    main = "todo-comments",
	opts =
    {
		highlight =
        {
			comments_only = true,
		},
		keywords =
        {
			BUG   = { icon = " ", color = "error",   alt = { "FIXME",       "FIXIT",      "ISSUE"        }},
			TODO  = { icon = "t ", color = "todo",    alt = { "TASK",        "ASSIGNMENT", "DO"           }},
			HACK  = { icon = " ", color = "warning", alt = { "SKETCHY",     "PROTOTYPE",  "JANKY"        }},
			WARN  = { icon = " ", color = "hack",    alt = { "WARNING",     "XXX",        "CAREFUL"      }},
			PERF  = { icon = " ", color = "perf",    alt = { "PERFORMANCE", "OPTIM",      "OPTIMIZATION" }},
			NOTE  = { icon = " ", color = "hint",    alt = { "INFO",        "COMMENT",    "HINT"         }},
			TEST  = { icon = "⏲ ", color = "test",    alt = { "TESTING",     "PASSED",     "FAILED"       }},
			TODAY = { icon = "! ", color = "today",   alt = { "URGENT",      "CURRENT",    "PRIORITY"     }},
			WORK  = { icon = "⅄ ", color = "work",    alt = { "WIP",         "DOING",      "WORKING"      }},
			BACK  = { icon = "🗓", color = "back",    alt = { "BACKLOG",     "FUTURE",     "MAYBE"        }},
			LOOK  = { icon = "🌐", color = "lookup",  alt = { "LOOKUP",      "SEARCH",     "INVESTIGATE"  }},
			LEAK  = { icon = "🗲 ", color = "leak",    alt = { "SEGFAULT",    "SIGSEGV",    "ASAN", "USE-AFTER-FREE", "HEAP-BUFFER-OVERFLOW"}},
		},
        merge_keywords = true,
        colors =
        {
            error   = { "DiagnosticError",   "ErrorMsg",   "#DA3530" },
            warn    = { "DiagnosticWarn",    "WarningMsg", "#FBBF24" },
            hack    = { "DiagnosticWarn",                  "#AA5025" },
            perf    = { "DiagnosticPerf",                  "#A1CC40" },
            todo    = { "DiagnosticTodo",                  "#35BBFF" },
            hint    = { "DiagnosticHint",                  "#10B981" },
            test    = { "DiagnosticTest",                  "#FF00FF" },
            today   = { "DiagnosticUrgent",                "#AA20FF" },
            work    = { "DiagnosticCurrent",               "#DD6010" },
            lookup  = { "DiagnosticLookup",                "#4060FF" },
            leak    = { "DiagnosticLeak",                  "#FF1520" },
            back    = { "DiagnosticBacklog",               "#CC9090" },
            default = { "Identifier",                      "#7C3AED" },
        },
	},
	keys =
    {
		{ "]]t", "<cmd>lua require('todo-comments').jump_next()<CR>" },
		{ "[[t", "<cmd>lua require('todo-comments').jump_prev()<CR>" },
        { "]t", "<cmd>lua require('todo-comments').jump_next({ keywords = { 'TODO' } })<CR>" },
        { "[t", "<cmd>lua require('todo-comments').jump_prev({ keywords = { 'TODO' } })<CR>" },
        { "]c", "<cmd>lua require('todo-comments').jump_next({ keywords = { 'NOTE', 'INFO', 'HINT', 'COMMENT' } })<CR>", },
		{ "[c", "<cmd>lua require('todo-comments').jump_prev({ keywords = { 'NOTE', 'INFO', 'HINT', 'COMMENT' } })<CR>", },
		{ "]f", "<cmd>lua require('todo-comments').jump_next({ keywords = { 'FIX', 'FIXME', 'BUG', 'FIXIT', 'ISSUE', 'ERROR' } })<CR>", },
		{ "[f", "<cmd>lua require('todo-comments').jump_prev({ keywords = { 'FIX', 'FIXME', 'BUG', 'FIXIT', 'ISSUE', 'ERROR' } })<CR>", },
		{ "]w", "<cmd>lua require('todo-comments').jump_next({ keywords = { 'HACK', 'WARNING', 'XXX' } })<CR>", },
		{ "[w", "<cmd>lua require('todo-comments').jump_prev({ keywords = { 'HACK', 'WARNING', 'XXX' } })<CR>", },
        { "]r", "<cmd>lua require('todo-comments').jump_next({ keywords = { 'TEST', 'RESULT', 'TESTING', 'PASSED', 'FAILED' } })<CR>", },
		{ "[r", "<cmd>lua require('todo-comments').jump_prev({ keywords = { 'TEST', 'RESULT', 'TESTING', 'PASSED', 'FAILED' } })<CR>", },
		{ "]p", "<cmd>lua require('todo-comments').jump_next({ keywords = { 'PERF', 'PERFORMANCE', 'OPTIMIZE', 'OPTIM' } })<CR>", },
		{ "[p", "<cmd>lua require('todo-comments').jump_prev({ keywords = { 'PERF', 'PERFORMANCE', 'OPTIMIZE', 'OPTIM' } })<CR>", },
		{ "<leader>tl", "<cmd>TodoTelescope<CR>" },
        { "<leader>tq", "<cmd>TodoQuickFix<CR>" },
    },
}
