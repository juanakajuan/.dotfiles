return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>ga", "<CMD>Git add .<CR>")
        vim.keymap.set("n", "<leader>gc", "<CMD>Git commit<CR>")
        vim.keymap.set("n", "<leader>gp", "<CMD>Git push<CR>")
        vim.keymap.set("n", "<leader>gd", "<CMD>Git diff<CR>")
        vim.keymap.set("n", "<leader>gl", "<CMD>Git log<CR>")
        vim.keymap.set("n", "<leader>gs", "<CMD>Git<CR>")
        vim.keymap.set("n", "<leader>gu", "<CMD>Git pull<CR>")
    end
}
