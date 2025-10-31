local M = {}

-- Store the session start time
local start_time = nil
local timer = nil

-- This will hold the formatted time string
local display_time = "0s"

function M.setup()
    start_time = os.time()

    -- Create and start the timer
    timer = vim.loop.new_timer()
    if timer then
        timer:start(
            0,
            1000,
            vim.schedule_wrap(function()
                M.update_display()
            end)
        )
    else
        vim.notify("timer is nil", vim.log.levels.ERROR)
    end
end

function M.update_display()
    local elapsed = os.time() - start_time
    display_time = M.format_time(elapsed)
end

function M.format_time(elapsed_time)
    -- TODO: Add days
    local hours = math.floor(elapsed_time / 3600)
    local minutes = math.floor((elapsed_time % 3600) / 60)
    local seconds = elapsed_time % 60

    return hours .. "h " .. minutes .. "m " .. seconds .. "s"
end

-- This function will be called by lualine
function M.get_time()
    return display_time
end

return M
