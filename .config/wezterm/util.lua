local M = {}

local paths = {
	"/bin:",
	"/usr/bin:",
	"/usr/local/bin:",
}

local paths_string = table.concat(paths)

function M.env_paths()
	return paths_string
end

M.filter = function(tbl, callback)
	local filt_table = {}

	for i, v in ipairs(tbl) do
		if callback(v, i) then
			table.insert(filt_table, v)
		end
	end
	return filt_table
end

return M
