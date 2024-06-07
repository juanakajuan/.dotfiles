return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
        require("dashboard").setup {
            theme = "hyper",
            config = {
                week_header = {
                    enable = true,
                },
                shortcut = {
                    {
                        desc = "󰊳 Update",
                        group = "@property",
                        action = "Lazy update",
                        key = "u",
                    },
                    {
                        icon = " ",
                        icon_hl = "@variable",
                        desc = "Files",
                        group = "Label",
                        action = "Telescope find_files",
                        key = "f",
                    },
                },
                project = { enable = false },
                mru = { limit = 6, cwd_only = true },
                footer = {
                    '""You miss 100% of the shots you don\'t take" -Wayne Gretzky" -Michael Scott',
                },
            },
        }
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
