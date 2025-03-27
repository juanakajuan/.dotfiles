vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup(
		"juan-highlight-yank",
		{ clear = true }
	),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.filetype.add {
	pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
	pattern = "*",
	command = "syntax sync fromstart",
})
