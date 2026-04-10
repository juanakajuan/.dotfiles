local lsp_conficts, _ = pcall(vim.api.nvim_get_autocmds, { group = "LspAttach_conflicts" })
if not lsp_conficts then
    vim.api.nvim_create_augroup("LspAttach_conflicts", {})
end

local auto_reload_group = vim.api.nvim_create_augroup("AutoReloadExternalChanges", { clear = true })
local auto_reload_watchers = {}

local function stop_auto_reload_watcher(bufnr)
    local watcher = auto_reload_watchers[bufnr]
    if not watcher then
        return
    end

    watcher:stop()
    watcher:close()
    auto_reload_watchers[bufnr] = nil
end

local function reload_buffer_if_changed(bufnr)
    if not vim.api.nvim_buf_is_valid(bufnr) or not vim.api.nvim_buf_is_loaded(bufnr) then
        stop_auto_reload_watcher(bufnr)
        return
    end

    if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].modified then
        return
    end

    vim.api.nvim_buf_call(bufnr, function()
        vim.cmd("silent! checktime")
    end)
end

local function start_auto_reload_watcher(bufnr)
    stop_auto_reload_watcher(bufnr)

    if not vim.api.nvim_buf_is_valid(bufnr) or vim.bo[bufnr].buftype ~= "" then
        return
    end

    local path = vim.api.nvim_buf_get_name(bufnr)
    if path == "" then
        return
    end

    local directory = vim.fs.dirname(path)
    local filename = vim.fs.basename(path)
    if not directory or not filename then
        return
    end

    local watcher = vim.uv.new_fs_event()
    if not watcher then
        return
    end

    local ok, err = watcher:start(directory, {}, vim.schedule_wrap(function(watch_err, changed_name)
        if watch_err then
            vim.notify("Auto-reload watcher error: " .. watch_err, vim.log.levels.WARN)
            return
        end

        if changed_name and changed_name ~= filename then
            return
        end

        reload_buffer_if_changed(bufnr)
    end))

    if not ok then
        watcher:close()
        vim.notify("Failed to watch " .. directory .. ": " .. err, vim.log.levels.WARN)
        return
    end

    auto_reload_watchers[bufnr] = watcher
end

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "BufFilePost" }, {
    group = auto_reload_group,
    desc = "Start watching file-backed buffers for external changes",
    callback = function(args)
        start_auto_reload_watcher(args.buf)
    end,
})

vim.api.nvim_create_autocmd({ "BufDelete", "BufUnload", "BufWipeout" }, {
    group = auto_reload_group,
    desc = "Stop watching buffers that are no longer loaded",
    callback = function(args)
        stop_auto_reload_watcher(args.buf)
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = "LspAttach_conflicts",
    desc = "prevent tsserver and volar competing",
    callback = function(args)
        if not (args.data and args.data.client_id) then
            return
        end
        local active_clients = vim.lsp.get_active_clients()
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        -- prevent tsserver and volar competing
        -- if client.name == "volar" or require("lspconfig").util.root_pattern("nuxt.config.ts")(vim.fn.getcwd()) then
        -- OR
        if client.name == "volar" then
            for _, client_ in pairs(active_clients) do
                -- stop tsserver if volar is already active
                if client_.name == "tsserver" then
                    client_.stop()
                end
            end
        elseif client.name == "tsserver" then
            for _, client_ in pairs(active_clients) do
                -- prevent tsserver from starting if volar is already active
                if client_.name == "volar" then
                    client.stop()
                end
            end
        end
    end,
})
