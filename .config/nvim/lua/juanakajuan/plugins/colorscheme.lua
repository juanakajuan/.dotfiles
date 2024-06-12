return {
    -- "andreypopp/vim-colors-plain",
    -- "widatama/vim-phoenix",
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    lazy = false,
    config = function()
        require("gruvbox").setup {
            bold = true,
            italic = {
                strings = false,
                emphasis = false,
                comments = true,
                operators = false,
                folds = true,
            },
            transparent_mode = true,
        }
        vim.cmd [[colorscheme gruvbox]]
        -- vim.cmd [[colorscheme plain]]
        -- vim.cmd [[colorscheme phoenix]]

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#282828" })
    end,
}
