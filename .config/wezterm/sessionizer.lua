local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

local fd = "/usr/bin/fd"

local function formatString(str)
    -- Replace dashes with spaces and capitalize the first letter of each word
    local formatted = str:gsub("%w+", function(word)
        return word:sub(1, 1):upper() .. word:sub(2):lower()
    end)
    return formatted:gsub("-", " ")
end

M.toggle = function(window, pane)
	local projects = {}

	local success, stdout, stderr = wezterm.run_child_process({
		fd,
		".",
		"--type", "d",  -- Search for directories only
		"--max-depth=4",
		"--prune",  -- Skip the contents of ignored directories
		"/home/juanix/Dev/Uni",
		"/home/juanix/Dev/Personal",
		"/home/juanix/Dev/Scratch",
		"/home/juanix/.dotfiles/.config",
	})

	if not success then
		wezterm.log_error("Failed to run fd: " .. stderr)
		return
	end

	for line in stdout:gmatch("([^\n]*)\n?") do
		local label = line
		local id = formatString(label:match("([^/]+)/*$"))
		table.insert(projects, { label = tostring(label), id = tostring(id) })
	end

	window:perform_action(
		act.InputSelector({
			action = wezterm.action_callback(function(win, _, id, label)
				if not id and not label then
					wezterm.log_info("Cancelled")
				else
					wezterm.log_info("Selected " .. label .. "Id: " .. id)
					win:perform_action(
						act.SwitchToWorkspace({ name = id, spawn = { cwd = label } }),
						pane
					)
				end
			end),
			fuzzy = true,
			title = "Select project",
			choices = projects,
		}),
		pane
	)
end

return M
