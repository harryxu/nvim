-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

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
