-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
-- vim.opt.fileencoding = 'utf-8'
vim.o.number = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true

-- disable backup and swap
vim.opt.backup = false
vim.opt.swapfile = false

vim.opt.autoread = true
vim.opt.showcmd = true -- show incomplete cmds down the bottom
vim.opt.showmode = true -- show current mode down the bottom

vim.opt.ignorecase = true
vim.opt.incsearch = true -- find the next match as we type the search
vim.opt.hlsearch = true -- hilight searches by default
vim.opt.smartcase = true
--vim.opt.autochdir = true -- switch to the directory of the open buffer

vim.opt.wildmenu = true
vim.opt.completeopt = 'longest,menuone'
vim.opt.splitbelow=true
