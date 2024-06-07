local config = {
    cmd = { vim.fn.expand "~/.local/share/nvim/mason/bin/jdtls" },
    root_dir = vim.fs.dirname(
        vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]
    ),

    handlers = {
        ["$/progress"] = function(_, result, ctx)
            -- disable progress updates.
        end,
    },
}
require("jdtls").start_or_attach(config)
