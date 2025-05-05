-- Set space as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = false }

-- Exit insert mode using 'kj'
keymap("i", "kj", "<Esc>l", opts)
keymap("v", "kj", "<Esc>l", opts)

-- Window management using leader key
keymap("n", "<Leader>v", "<C-w>v", opts) -- Split window vertically
keymap("n", "<Leader>s", "<C-w>s", opts) -- Split window horizontally
keymap("n", "<Leader>t", ":term<CR>", opts) -- Open trminal
keymap("n", "<Leader>x", ":x<CR>", opts) -- Close and save
keymap("n", "<Leader>w", ":w<CR>", opts) -- save
keymap("n", "<Leader>q", ":q<CR>", opts) -- close
keymap("n", "<Leader>q!", ":q!<CR>", opts) -- forcefully close
