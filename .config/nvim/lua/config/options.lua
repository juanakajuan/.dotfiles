-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Snacks animations
-- Set to `false` to globally disable all snacks animations
vim.g.snacks_animate = false

local opt = vim.opt

opt.relativenumber = false -- Relative line numbers
opt.scrolloff = 8 -- Lines of context
opt.wrap = true -- Enable word wrap
opt.tabstop = 4 -- Number of spaces tabs count for
