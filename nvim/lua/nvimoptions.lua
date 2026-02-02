-- set basic options
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- set vim to yank to system clipboard
vim.opt.clipboard = 'unnamedplus'

-- set relative line numbering
vim.wo.number = true
vim.wo.relativenumber = true
