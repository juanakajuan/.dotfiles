return {
    "session-timer",
    dir = "~/.config/nvim/lua/session-timer/",
    config = function()
        require("session-timer").setup()
    end,
}
