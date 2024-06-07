return {
    -- "sainnhe/gruvbox-material",
    -- "rose-pine/neovim",
    -- name = "rose-pine",
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
        -- vim.g.gruvbox_material_background = "medium"
        -- vim.g.gruvbox_material_better_performance = 1
        -- vim.g.gruvbox_material_float_style = "dim"
        -- vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
        -- vim.g.gruvbox_material_foreground = "original"
        -- vim.g.gruvbox_material_transparent_background = 2
        -- vim.cmd.colorscheme "gruvbox-material"
        -- require("rose-pine").setup {
        --     disable_background = true,
        --     styles = {
        --         bold = true,
        --         italic = false,
        --         -- transparency = true,
        --     },
        -- }
        -- vim.cmd.colorscheme "rose-pine"
        vim.cmd [[colorscheme gruvbox]]
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#282828" })
    end,
}
