return {
    "saghen/blink.cmp",
    opts = {
        keymap = {
            preset = "default",
            -- Disable Enter from accepting completion, only Ctrl-y will accept
            ["<CR>"] = { "fallback" },
        },
        completion = {
            accept = {
                -- experimental auto-brackets support
                auto_brackets = {
                    enabled = false,
                },
            },
            ghost_text = {
                enabled = false,
            },
        },
    },
}
