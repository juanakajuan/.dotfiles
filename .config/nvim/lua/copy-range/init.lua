local M = {}

local function get_visual_range()
    local mode = vim.fn.mode()
    local start_line
    local end_line

    if mode == "v" or mode == "V" or mode == "\22" then
        start_line = vim.fn.line("v")
        end_line = vim.fn.line(".")
    else
        start_line = vim.fn.line("'<")
        end_line = vim.fn.line("'>")
    end

    if start_line > end_line then
        start_line, end_line = end_line, start_line
    end

    return start_line, end_line
end

function M.copy_visual_range()
    local file = vim.fn.expand("%:.")

    if file == "" then
        vim.notify("Cannot copy range for an unnamed buffer", vim.log.levels.WARN)
        return
    end

    local start_line, end_line = get_visual_range()
    local line_range = string.format("%d-%d", start_line, end_line)
    local reference = string.format("File: %s\nLines: %s", file, line_range)

    vim.fn.setreg("+", reference)
    vim.notify(string.format("Copied %s (%s)", file, line_range), vim.log.levels.INFO)
end

return M
