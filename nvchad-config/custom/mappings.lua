---@type MappingsTable
local M = {}

M.general = {
    n = { -- Normal Mode

        ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
        ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },

        ["<C-d>"] = { "<C-d>zz", "keep cursor in the center on page down" },
        ["<C-u>"] = { "<C-u>zz", "keep cursor in the center on page up" },
        ["n"] = { "nzzzv", "keep cursor in the center when going next" },
        ["N"] = { "Nzzzv", "keep cursor in the center when going previous" },
        ["<F2>"] = {
            ":ClangdSwitchSourceHeader<CR>",
            "switch between header and source files",
        },

        -- Unbind save
        ["<C-s>"] = { "<Nop>" },

        ["<C-f>"] = { "<cmd>silent !tmux neww tmux-sessionizer.sh<CR>" },

        -- --  format with conform
        -- ["<leader>fm"] = {
        -- 	function()
        -- 		require("conform").format()
        -- 	end,
        -- 	"formatting",
        -- },
    },

    v = { -- Visual Mode
        [">"] = { ">gv", "indent" },
        ["J"] = { ":m '>+1<CR>gv=gv", "move line down" },
        ["K"] = { ":m '<-2<CR>gv=gv", "move line up" },
    },
}

-- more keybinds!

return M
