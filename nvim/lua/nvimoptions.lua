-- set line numbering and no wrap
vim.wo.number = true
vim.wo.relativenumber = true

-- format options from https://neovim.io/doc/user/change.html#fo-table
-- TODO: find a way to set these options after \ftplugin\lua.lua, possible on windows?
vim.opt.formatoptions:remove("c")
vim.opt.formatoptions:remove("r")
vim.opt.formatoptions:remove("o")
vim.opt.formatoptions:remove("t")

-- set from tutorial
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- set vim to yank to system clipboard
vim.opt.clipboard = 'unnamedplus'

