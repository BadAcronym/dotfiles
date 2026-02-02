vim.g.mapleader = " "

vim.g.have_nerd_font = true
vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

vim.cmd([[colorscheme gruvbox]])
require("nvimoptions")

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.cmd([[mkview]])
		vim.cmd([[%s/\s\+$//e]])
		vim.cmd([[%s/\n\{3,}/\r\r/e]])
		vim.cmd([[%s/\_s*\%$//e]])
		vim.cmd([[loadview]])
	end,
})
