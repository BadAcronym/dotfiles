vim.wo.wrap           = false
vim.wo.number         = true
vim.wo.relativenumber = true
vim.wo.signcolumn     = 'yes:1'

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.opt.clipboard     = "unnamedplus"
vim.opt.guicursor     = "n-v-c-i:block-Cursor/lcursor"
vim.opt.cursorline    = true
vim.opt.cursorlineopt = "line"
-- perfect size for two split terminals, side-by-side with my current wezterm config!
vim.opt.textwidth     = 88
-- always 1 more than textwidth.
vim.opt.colorcolumn   = "89"

vim.o.swapfile    = false
vim.o.undofile    = true
vim.o.backup      = false
vim.o.writebackup = false
vim.o.undodir     = os.getenv("HOME") .. "/.cache/nvim/undodir"

vim.opt.fillchars = "eob: "

vim.keymap.set({"n", "v"}, "<C-h>", "<C-u>")  --move
vim.keymap.set({"n", "v"}, "r", "<C-r>")      --redo
vim.keymap.set({"n", "v"}, "<leader>r", "q")  --record macro
vim.keymap.set({"n", "v"}, "q", "<cmd>q<CR>") --quit buffer

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
