return {
	"preservim/tagbar",
	event = "VeryLazy",
	config = function()
		vim.keymap.set("n", "<F8>", ":TagbarToggle<CR>", { noremap = true, silent = true, desc = "toggle tagbar" })
	end,
}
