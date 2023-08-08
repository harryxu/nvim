-- Leader/local leader - lazy.nvim needs these set first
vim.g.mapleader = ' '
-- vim.g.mapleader = [[ ]]
-- vim.g.maplocalleader = [[,]]

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')

local keymap = vim.keymap

----------------- ## Base settings
vim.cmd('autocmd!')

vim.api.nvim_exec ('language en_US', true)

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
vim.opt.autochdir = true -- switch to the directory of the open buffer

vim.opt.wildmenu = true
vim.opt.completeopt = 'longest,menuone'
vim.opt.splitbelow=true

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*',
  command = 'set nopaste'
})

-- color theme
vim.opt.background = 'dark'
vim.cmd [[colorscheme nordfox]]

-- ### keymaps
keymap.set('', '<F2>', ':nohlsearch<CR>')

-- ctrl/command s for save file
keymap.set('n', '<C-s>', ':update<CR>')
keymap.set('v', '<C-s>', '<C-C>:update<CR>')
keymap.set('i', '<C-s>', '<C-O>:update<CR>')

keymap.set('n', '<D-s>', ':update<CR>')
keymap.set('v', '<D-s>', '<C-C>:update<CR>')
keymap.set('i', '<D-s>', '<C-O>:update<CR>')

-- copy to clip board by ctrl/command c
keymap.set('v', '<C-c>', '"+y')
keymap.set('v', '<D-c>', '"+y')


----------------- ## Plugin settings

-- ### nvim tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require('nvim-tree').setup()
keymap.set({'n', 'i', 'v'}, '<F3>', '<ESC>:NvimTreeToggle<CR>')
