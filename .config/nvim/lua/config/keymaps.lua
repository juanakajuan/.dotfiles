-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Page jump up and down while keeping cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("v", "J", ":move '>+1<CR>gv=gv") -- Move visual selection down
vim.keymap.set("v", "K", ":move '<-2<CR>gv=gv") -- Move visual selection up

-- Paste without overwritting the yank buffer
vim.keymap.set("x", "<leader>p", [["_dP]])
