return {
    "mbbill/undotree",
    config = function()
        vim.g.undotree_WindowLayout = 2
    end,
    keys = {
        {
            "<F5>",
            vim.cmd.UndotreeToggle,
            mode = { "n" },
            desc = "Undotree Toggle",
        },
    },
}
