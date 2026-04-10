-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Page jump up and down while keeping cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { desc = "Go to left window" })
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { desc = "Go to lower window" })
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { desc = "Go to upper window" })
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { desc = "Go to right window" })

vim.keymap.set("n", "<C-f>", function()
  local sessionizer = vim.fn.expand("~/bin/tmux-sessionizer.sh")

  if vim.env.TMUX and vim.env.TMUX ~= "" then
    vim.fn.jobstart({ "tmux", "display-popup", "-w", "90%", "-h", "90%", "-E", sessionizer }, { detach = true })
    return
  end

  vim.cmd("terminal " .. vim.fn.fnameescape(sessionizer))
end, { desc = "Run tmux sessionizer" })

vim.keymap.set("n", "<leader>tr", function()
  Snacks.terminal.toggle(nil, { win = { position = "right", width = 0.5 } })
end, { desc = "Terminal right" })

vim.keymap.set("v", "J", ":move '>+1<CR>gv=gv") -- Move visual selection down
vim.keymap.set("v", "K", ":move '<-2<CR>gv=gv") -- Move visual selection up

-- Paste without overwritting the yank buffer
vim.keymap.set("x", "<leader>p", [["_dP]])
