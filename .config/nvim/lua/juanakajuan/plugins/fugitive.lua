return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>ga", "<CMD>Git add .<CR>")
        vim.keymap.set("n", "<leader>gc", "<CMD>Git commit<CR>")
    end
}
