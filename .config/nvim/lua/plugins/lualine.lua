return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local custom_gruvbox_dark = require("lualine.themes.gruvbox_dark")
        -- Set all mode backgrounds to the same dark color (#161616) for consistency
        custom_gruvbox_dark.normal.c.bg = "#161616" -- Normal mode center section
        custom_gruvbox_dark.insert.c.bg = "#161616" -- Insert mode center section
        custom_gruvbox_dark.visual.c.bg = "#161616" -- Visual mode center section
        custom_gruvbox_dark.replace.c.bg = "#161616" -- Replace mode center section
        custom_gruvbox_dark.command.c.bg = "#161616" -- Command mode center section
        custom_gruvbox_dark.inactive.c.bg = "#161616" -- Inactive window center section

        require("lualine").setup({
            options = {
                theme = custom_gruvbox_dark,
                component_separators = "",
                section_separators = "",
            },
            sections = {
                -- lualine_x is the right-center section of the statusline
                lualine_x = {
                    function()
                        return require("session-timer").get_time()
                    end,
                    "encoding",
                    "fileformat",
                    "filetype",
                },
            },
        })
    end,
}
