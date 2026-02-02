-- set options & keybindings
require("nvimoptions")
require("nvimbindings")

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

-- load plugins & configure
  require("lazy").setup("plugins")

-- treesitter config
  require("nvim-treesitter.configs").setup({
    ensure_installed = {"c", "cpp", "markdown", "yaml", "toml", "vim", "vimdoc", "markdown_inline"},
    highlight = { enable = true },
    indent = { enable = true }
  })

-- telescope config
  local builtin = require("telescope.builtin")
  vim.keymap.set("n", "<C-p>",
    "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<CR>", 
    {} )
  vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<cr>", {})
  vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
-- fix UI select
  require("telescope").load_extension("ui-select")


-- neotree config
  vim.keymap.set('n', '<C-b>', ':Neotree <CR>')

-- todo-comments config
  require("todo-comments").setup({
    highlight = {
      comments_only = false,  
    }
  })
  vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
  end, { desc = "Next todo comment" })

  vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
  end, { desc = "Previous todo comment" })

  vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
  end, { desc = "Next error/warning todo comment" })  

-- set colour scheme
-- available themes:
-- tokyonight-night, toykonight-storm, tokyonight-moon, gruvbox
  vim.cmd[[colorscheme gruvbox]]
