return {
    "A7Lavinraj/fyler.nvim",
    dependencies = { "nvim-mini/mini.icons" },
    branch = "stable",
    opts = {},

    vim.keymap.set("n", "-", "<CMD>Fyler<CR>", { desc = "Open Flyer" }),
}
