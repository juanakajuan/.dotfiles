return {
        "rest-nvim/rest.nvim",
        ft = "http",
        dependencies = { "luarocks.nvim" },
        config = function()
            require("rest-nvim").setup({
            result = {
                split = {
                    in_place = true
                }
            }
        })

            vim.keymap.set("n", "<leader>rr", "<CMD> Rest run<CR>")
            vim.keymap.set("n", "<leader>rl", "<CMD> Rest run last<CR>")
        end,
}
