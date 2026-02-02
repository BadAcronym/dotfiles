-- set <leader> key to spacebar
vim.g.mapleader=" "

-- set options & keybindings
require("nvimoptions")

-- lazy.nvim setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- load all plugins in lua\plugins
require("lazy").setup("plugins")

-- set colour scheme from lua\themes.lua:
-- tokyonight-night, toykonight-storm, tokyonight-moon, gruvbox
vim.cmd[[colorscheme gruvbox]]
