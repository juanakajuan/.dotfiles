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

        -- Git blame function - extracts author and date info for current line
        local function git_blame()
            local current_line = vim.fn.line(".") -- Get current cursor line number
            local filename = vim.fn.expand("%") -- Get current file path

            -- Build git blame command:
            -- -L start,end : Only blame the specific line range (current line only)
            -- --porcelain  : Machine-readable output format (easier to parse)
            -- 2>/dev/null  : Suppress error messages if not in git repo
            local cmd =
                string.format("git blame -L %d,%d --porcelain %s 2>/dev/null", current_line, current_line, filename)

            -- Execute the git command and capture output
            local handle = io.popen(cmd)
            if not handle then
                return ""
            end -- Return empty if command fails

            local result = handle:read("*a") -- Read all output
            handle:close() -- Close the process handle

            if result == "" then
                return ""
            end -- No output means not a git repo or other error

            -- Parse the porcelain output format:
            -- Lines starting with 'author ' contain the commit author name
            -- Lines starting with 'author-time ' contain Unix timestamp
            local author = result:match("author (.-)\n") -- Extract author name
            local author_time = result:match("author%-time (%d+)") -- Extract timestamp (%-escapes the hyphen)

            -- Validation checks
            if not author or not author_time or author == "Not Committed Yet" then
                return "" -- Return empty for uncommitted changes or parsing failures
            end

            -- Format the timestamp into readable date
            -- os.date converts Unix timestamp to formatted date string
            local date = os.date("%m/%d/%y", tonumber(author_time))

            -- Truncate long author names to prevent statusline overflow
            -- If author name > 12 chars, take first 12 and add ellipsis
            local short_author = author:len() > 12 and author:sub(1, 12) .. "..." or author

            -- Format final display string with icon, author, and date
            return string.format("👷 %s | %s", short_author, date)
        end

        require("lualine").setup({
            options = {
                theme = custom_gruvbox_dark,
                component_separators = "",
                section_separators = "",
            },
            sections = {
                -- lualine_x is the right-center section of the statusline
                lualine_x = {
                    {
                        git_blame,
                        -- Conditional display: only show when:
                        -- 1. Buffer is a regular file (not help, terminal, etc.)
                        -- 2. Git executable is available on the system
                        cond = function()
                            return vim.bo.buftype == "" and vim.fn.executable("git") == 1
                        end,
                    },
                    "encoding",
                    "fileformat",
                    "filetype",
                },
            },
        })
    end,
}
