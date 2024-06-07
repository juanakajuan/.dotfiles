vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.keymap.set("n", "<C-a>", "<C-^>")

-- Quick fix list navigation
vim.keymap.set("n", "<leader>qn", "<CMD>cnext<CR>zz")
vim.keymap.set("n", "<leader>qp", "<CMD>cprev<CR>zz")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Replace the word that I am currently on
vim.keymap.set(
    "n",
    "<leader>s",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Find and replace on current word" }
)

vim.keymap.set(
    "x",
    "<leader>p",
    '"_dP',
    { desc = "Paste over highlighted text and still have the stuff I pasted" }
)

vim.keymap.set(
    "n",
    "<leader>zm",
    "<CMD>ZenMode<CR>",
    { desc = "Activate ZenMode" }
)
vim.keymap.set("n", "<leader>cl", "<CMD>ClangdSwitchSourceHeader<CR>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- go to  beginning and end
vim.keymap.set("i", "<C-b>", "<ESC>^i")
vim.keymap.set("i", "<C-e>", "<End>")

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-f>", "<CMD>silent !tmux neww tmux-sessionizer.sh<CR>")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set(
    "n",
    "k",
    "v:count == 0 ? 'gk' : 'k'",
    { expr = true, silent = true }
)
vim.keymap.set(
    "n",
    "j",
    "v:count == 0 ? 'gj' : 'j'",
    { expr = true, silent = true }
)

-- -- Diagnostic keymaps
-- vim.keymap.set(
--     "n",
--     "[d",
--     vim.diagnostic.goto_prev,
--     { desc = "Go to previous diagnostic message" }
-- )
-- vim.keymap.set(
--     "n",
--     "]d",
--     vim.diagnostic.goto_next,
--     { desc = "Go to next diagnostic message" }
-- )
vim.keymap.set(
    "n",
    "<leader>e",
    vim.diagnostic.open_float,
    { desc = "Open floating diagnostic message" }
)
