return {
    "copy-range",
    dir = vim.fn.stdpath("config") .. "/lua/copy-range/",
    keys = {
        {
            "<leader>yr",
            function()
                require("copy-range").copy_visual_range()
            end,
            mode = "x",
            desc = "Copy file line range",
        },
    },
}
