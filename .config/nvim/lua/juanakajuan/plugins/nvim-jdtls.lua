return {
    "mfussenegger/nvim-jdtls",
    config = function ()
        vim.keymap.set("v", "<leader>joi", "<Cmd>lua require'jdtls'.organize_imports()<CR>")
        vim.keymap.set("v", "<leader>jev", "<Cmd>lua require('jdtls').extract_variable()<CR>")
        -- vim.keymap.set("n", "crv", "<Cmd>lua require('jdtls').extract_variable(true)<CR>")
        vim.keymap.set("v", "<leader>jec", "<Cmd>lua require('jdtls').extract_constant()<CR>")
        -- vim.keymap.set("n", "crc", "<Cmd>lua require('jdtls').extract_constant(true)<CR>")
        vim.keymap.set("v", "<leader>jem", "<Cmd>lua require('jdtls').extract_method(true)<CR>")
    end
}
