vim.g.mapleader=" "

require("nvimoptions")

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

-- vim.cmd[[colorscheme tokyonight-night]]
-- vim.cmd[[colorscheme tokyonight-storm]]
-- vim.cmd[[colorscheme tokyonight-moon]]
vim.cmd[[colorscheme gruvbox]]
