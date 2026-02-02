vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.opt.clipboard = "unnamedplus"
vim.opt.guicursor = "n-v-c-i:block-Cursor/lcursor"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "line"

vim.opt.fillchars = "eob: "

vim.keymap.set({"n", "v"}, "<C-h>", "<C-u>")
