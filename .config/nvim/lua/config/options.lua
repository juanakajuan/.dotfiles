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
opt.shiftwidth = 4

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        -- Only copy if the user actually pressed 'y'
        -- This ignores deletions like 'dd' or 'd'
        if vim.v.event.operator == "y" then
            local contents = vim.v.event.regcontents
            require("vim.ui.clipboard.osc52").copy("+")(contents)
            require("vim.ui.clipboard.osc52").copy("*")(contents)
        end
    end,
})
