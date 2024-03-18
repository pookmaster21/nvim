return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})

			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { noremap = true, silent = true })
			vim.keymap.set(
				"n",
				"<leader>gt",
				":Gitsigns toggle_current_line_blame<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { noremap = true, silent = true, desc = "git commit" })
			vim.keymap.set("n", "<leader>ga", ":Git add .<CR>", { noremap = true, silent = true, desc = "git add" })
			vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { noremap = true, silent = true, desc = "git push" })
			vim.keymap.set("n", "<leader>gi", ":Git init<CR>", { noremap = true, silent = true, desc = "git init" })
		end,
	},
}
