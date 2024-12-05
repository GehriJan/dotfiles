-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.g.colors_name = "catppuccin"
local vim_init = vim.fn.stdpath("config") .. "/vim_init.vim"
vim.cmd.source(vim_init)
